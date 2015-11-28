//
//  AllListsViewController.m
//  Checklists
//
//  Created by VoidWu on 15/11/27.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import "AllListsViewController.h"
#import "Checklist.h"
#import "ChecklistViewController.h"
#import "ChecklistItem.h"
#import "DataModel.h"
@interface AllListsViewController ()

@end

@implementation AllListsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
  //  NSLog(@"%@",[self documentsDirectory]);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 表视图控制器的三个init方法:
 1.其中initWithCoder用于从storyboard中加载视图控制器,
 initWithCoder方法中：记住当应用从storyboard中加载视图控制器的时候,UIKit将会自动触发这方法
 2.initWithNib用于从nib文件中加载视图控制器
 3.initWithStyle则用于手动创建视图控制器
 */
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    if ((self = [super initWithCoder:aDecoder])) {
//        [self loadChecklists];
//    }
//    return self;
//}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataModel.lists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        //手动创建 cell
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSLog(@"%ld",[self.dataModel.lists count]);

    Checklist *checklist = self.dataModel.lists[indexPath.row];
    NSLog(@"%ld",[checklist.items count]);
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    //点击选择行的时候使其跳转到showchecklist的场景，并传递checklist参数。
    //手动写ui代码 sender参数可以传递任意参数；
    //若是storyboard的话，则传递的是控件,见ChecklistViewController
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle: (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.dataModel.lists removeObjectAtIndex:indexPath.row];
    //[self saveChecklistItems];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

//手动cell代码时设置信息圈的监听
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath{
    //需要将下一界面的导航栏界面设置storyid为“ListNavigationController”
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    ListDetailViewController *controller = (ListDetailViewController*)navigationController.topViewController;
    controller.delegate = self;
    Checklist *checklist = self.dataModel.lists[indexPath.row];
    controller.checklistToEdit = checklist;
    [self presentViewController:navigationController animated:YES completion:nil];
    
}


//切换到别的界面之前
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //    if([segue.identifier isEqualToString:@"ShowChecklist"]){
    //        ChecklistViewController *controller = segue.destinationViewController;
    //        controller.checklist = sender;
    //    }
    
    //
    if([segue.identifier isEqualToString:@"ShowChecklist"]){
        ChecklistViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    }else if([segue.identifier isEqualToString:@"AddChecklist"]){
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController *controller = (ListDetailViewController*)navigationController.topViewController;
        
        //传递代理
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:
(Checklist *)checklist{
    NSInteger newRowIndex = [self.dataModel.lists count];
    [self.dataModel.lists addObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist: (Checklist *)checklist{
    NSInteger index = [self.dataModel.lists indexOfObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

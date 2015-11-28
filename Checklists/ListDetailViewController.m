//
//  ListDetailViewController.m
//  Checklists
//
//  Created by VoidWu on 15/11/27.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import "ListDetailViewController.h"
#import "Checklist.h"

@interface ListDetailViewController ()

@end

@implementation ListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //载入判断是否有checklist传入，若有传入则执行编辑，没有传入则默认为添加界面
    //checklist有AllListsViewContronller通过prepareForSegue传入
    if (self.checklistToEdit != nil) {
        self.title = @"Edit Checklist";
        self.textField.text = self.checklistToEdit.name;
        NSLog(@"%@",self.checklistToEdit.name);
        self.doneBarButton.enabled = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //保证切入界面时，光标锁定textfield,并且弹出键盘
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel:(id)sender{
    //.h文件 已声明 id<ListDetailViewControllerDelegate> delegate;
    //当点击了取消按钮，调用代理的方法
    [self.delegate listDetailViewControllerDidCancel:self];
}

-(IBAction)done:(id)sender{
    if(self.checklistToEdit == nil){
        Checklist *checklist = [[Checklist alloc]init];
        checklist.name = self.textField.text;
        [self.delegate listDetailViewController:self didFinishAddingChecklist:checklist];
    }else{
        self.checklistToEdit.name = self.textField.text;
        [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
    }
}
#pragma mark - Table view data source


-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    //文字变化时才使done按钮显示可用
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = ([newText length]>0);
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


@end

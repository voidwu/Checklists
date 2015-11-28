//
//  ListDetailViewController.h
//  Checklists
//
//  Created by VoidWu on 15/11/27.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理，用于传值 listdetailviewcontroller 向 alllistsviewcontroller checklist；
@class ListDetailViewController;
@class Checklist;
@protocol ListDetailViewControllerDelegate <NSObject>

- (void)listDetailViewControllerDidCancel:(ListDetailViewController *) controller;
- (void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;
- (void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;
@end


@interface ListDetailViewController : UITableViewController


@property(nonatomic, weak) IBOutlet UITextField *textField;
@property(nonatomic, weak) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic, weak) id <ListDetailViewControllerDelegate> delegate;
@property(nonatomic,strong) Checklist *checklistToEdit;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;
@end

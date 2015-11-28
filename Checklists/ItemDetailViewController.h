//
//  AddItemTableViewController.h
//  Checklists
//
//  Created by VoidWu on 15/11/26.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>
-(void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
-(void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem*)item;
-(void)itemDetailViewController:(ItemDetailViewController*)controller
        didFinishEditingItem:(ChecklistItem*)item;
@end


@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>
- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property(nonatomic,weak) id <ItemDetailViewControllerDelegate> delegate;
@property(nonatomic,strong) ChecklistItem *itemToEdit;

@end

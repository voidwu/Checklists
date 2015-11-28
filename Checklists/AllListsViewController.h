//
//  AllListsViewController.h
//  Checklists
//
//  Created by VoidWu on 15/11/27.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
@class DataModel;

@interface AllListsViewController : UITableViewController<ListDetailViewControllerDelegate>

@property(nonatomic,strong)DataModel *dataModel;
-(void)saveChecklists;

@end

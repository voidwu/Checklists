//
//  ChecklistsTableViewController.h
//  Checklists
//
//  Created by VoidWu on 15/11/25.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController<ItemDetailViewControllerDelegate>
@property(nonatomic,strong)Checklist *checklist;
@end

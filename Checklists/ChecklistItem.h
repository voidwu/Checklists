//
//  ChecklistItem.h
//  Checklists
//
//  Created by VoidWu on 15/11/26.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject<NSCoding>
@property(nonatomic,copy)NSString *text;
@property(nonatomic,assign)BOOL checked;
- (void)toggleChecked;
@end

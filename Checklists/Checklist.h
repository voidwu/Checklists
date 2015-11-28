//
//  Checklist.h
//  Checklists
//
//  Created by VoidWu on 15/11/27.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>
@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSMutableArray *items;

@end

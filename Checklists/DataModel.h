//
//  DataModel.h
//  Checklists
//
//  Created by VoidWu on 15/11/28.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property(nonatomic,strong)NSMutableArray *lists;
-(void)saveChecklists;
@end

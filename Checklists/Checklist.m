//
//  Checklist.m
//  Checklists
//
//  Created by VoidWu on 15/11/27.
//  Copyright © 2015年 VoidWu. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist
- (id) init{
    if((self =[super init])){
        self.items = [[NSMutableArray alloc]initWithCapacity:20];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super init])){
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.items = [aDecoder decodeObjectForKey:@"Items"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"Name"];
    [aCoder encodeObject:self.items forKey:@"Items"];
}
@end

//
//  Status.m
//  06-模型设计练习
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Status.h"

@implementation Status
- (void)dealloc
{
    [_text release];
    [_user release];
    [_retweetStatus release];
    [_icon release];
    
    [super dealloc];
}
@end

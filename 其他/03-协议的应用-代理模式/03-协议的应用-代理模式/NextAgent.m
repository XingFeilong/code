//
//  NextAgent.m
//  03-协议的应用-代理模式
//
//  Created by tom-pc on 15/9/10.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "NextAgent.h"

@implementation NextAgent

// 票价
- (double)ticketPrice
{
    // ……亲自跑电影院、或者打电话
    return 1000;
}

// 剩余的票数
- (int)leftTicketsNumber
{
    // ……亲自跑电影院、或者打电话
    return 2;
}

@end

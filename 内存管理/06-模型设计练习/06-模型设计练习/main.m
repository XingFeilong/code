//
//  main.m
//  06-模型设计练习
//
//  Created by tom-pc on 15/9/8.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Status.h"

int main(int argc, const char * argv[])
{
    // 新建两个用户
    User *u = [[User alloc] init];
    u.name = @"2B";

    User *u2 = [[User alloc] init];
    u2.name = @"傻逼";
    
    // 新建两条微博
    Status *s = [[Status alloc] init];
    s.text = @"今天天气真好！！！";
    s.user = u;
    
    Status *s2 = [[Status alloc] init];
    s2.text = @"今天天气真的很好";
    s2.retweetStatus = s;
    s2.user = u2;
    
    [u2 release];
    [u release];
    [s2 release];
    [s release];
    return 0;
}

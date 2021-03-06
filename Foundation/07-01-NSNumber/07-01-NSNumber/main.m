//
//  main.m
//  07-01-NSNumber
//
//  Created by tom-pc on 15/9/15.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    CGPoint p = CGPointMake(10, 10);
    NSValue *value = [NSValue valueWithPoint:p];
    
    NSArray *array = @[value];
    
    [value pointerValue]; // 将value转为对应的结构体
    
    
    
    // 4
    
    // 将各种基本数据类型包装成NSNumber对象
    // @YES \ @10.5 \ @'A'(NSNumber数据类型，'A'字符是基本数据类型) \ @"A"(NSString对象)
    
    
    // 将age变量包装成NSNumber对象
    int age = 100;
    //[NSNumber numberWithInt:age];
    @(age); // 小括号的作用：取值。取出age的值进行包装
    
    // @age; 直接这样写，编译器会认为是关键字与@interface同理
    
    
    // @20 将 20包装成NSNumber对象
    NSArray *array1 = @[
      
      @{@"name" : @"Jack", @"age" : [NSNumber numberWithInt:20]},
      @{@"name" : @"Rose", @"age" : [NSNumber numberWithInt:22]},
      @{@"name" : @"xxm", @"age" : @21}
      
      ];
    
    
    // 编译器特性
    // 20包装成NSNumber对象
    //[NSNumber numberWithInt:20]
    
    // 简写
    // @20
    
    
    // 2
    
    // double类型的数据包装与转换
    NSNumber *num = [NSNumber numberWithDouble:10.4];
    
    double b = [num doubleValue]; // 将Number类型转成double类型，方便取出
    
    NSLog(@"%f", b);
    
    
    // 3
    
    // 将20这个基本数据类型转换成字符串类型
    int a = 20;
    
    // @“20”
    NSString *str = [NSString stringWithFormat:@"%d", a];
    
    int c = [str intValue];  // 将字符串转成整数
    
    NSLog(@"%d", c);
    
    NSLog(@"%d", [@"230" intValue]);
    
    return 0;
}


void test()
{
    // 1
    
    NSNumber *num = [NSNumber numberWithInt:10]; // 将int类型数据包装成NSNumber类型
    
    NSDictionary *dict = @{
                           @"name" : @"Jack", @"age" : num,
                           
                           };
    
    NSNumber *num2 = dict[@"age"]; // 取出NSNumber数据类型
    
    int a = [num2 intValue]; // 调用方法intValue，将NSNumber数据类型转成int类型，才能返回int类型的结果，方便取出
    
    NSLog(@"%d", a);
    
    NSLog(@"%@", dict);
}

//
//  hashiqi.h
//  02-protocol
//
//  Created by tom-pc on 15/9/9.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "Dog.h"

@protocol MyDogProtocol <NSObject>

- (void)dogtest;

@end

@interface hashiqi : Dog<MyDogProtocol>

@end

@interface hashiqi (Addxx)
- (void)addTest;
@end
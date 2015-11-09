//
//  AppView.h
//  Practice01
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class App;

@interface AppView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, strong) App *appModel;
+ (instancetype)app;
+ (instancetype)appViewWithAppModel:(App *)appModel;
@end

//
//  ViewController.m
//  Practice01
//
//  Created by tom-pc on 15/11/6.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "App.h"
#import "AppView.h"

#define xAppViewW 65
#define xAppViewH 105
#define xColCount 3

@interface ViewController ()
@property (nonatomic, strong)NSArray *appList;

@end

@implementation ViewController

- (NSArray *)appList
{
    if (_appList == nil) {
        _appList = [App appModel];
    }
    return _appList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat paddingX = (self.view.bounds.size.width - xAppViewW * xColCount) * 0.25;
    CGFloat paddingY = 45;
    
    for (int i = 0; i < self.appList.count; i++) {
        int row = i / xColCount; // 行
        int col = i % xColCount; // 列
        
        CGFloat x = paddingX + col * (xAppViewW + paddingX);
        CGFloat y = paddingY + row * (xAppViewH + paddingY);
        
        AppView *appView = [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
        // XIB设置视图位置
        appView.frame = CGRectMake(x, y, xAppViewW, xAppViewH);
        [self.view addSubview:appView];
        
        // 拿出对应字典数据
        App *model = self.appList[i];
        
        // 实现视图内部细节
//        UIImageView *icon = appView.subviews[0];
        UIImageView *icon = appView.iconView;
        // 设置图像
        icon.image = [UIImage imageNamed:model.icon]; // 实例化模型

        
//        UILabel *label = appView.subviews[1];
        UILabel *label = appView.label;
        // 设置label
        label.text = model.name;
        
        
//        UIButton *button = appView.subviews[2];
        UIButton *button = appView.button;
        // 给按钮添加监听方法
        button.tag = i;
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

#pragma mark - 按钮监听
- (void)click:(UIButton *)button
{
    NSLog(@"%s %ld", __func__, button.tag);
    // 添加一个label到界面上
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(45, 600, 285, 44)];
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    // 设置内容
    App *model = self.appList[button.tag];
    label.text = model.name;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    // 动画准备工作
    label.alpha = 0.0; // 关键一步，开始把label设置为透明
    button.enabled = NO;
    
    // 动画
    // 开始动画
    [UIView animateWithDuration:2.0f animations:^{
        NSLog(@"动画开始");
        label.alpha = 1.0;
    } completion:^(BOOL finished) {
        // 设置隐藏动画
        [UIView animateWithDuration:2.0 animations:^{
            label.alpha = 0.0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
    
}

@end

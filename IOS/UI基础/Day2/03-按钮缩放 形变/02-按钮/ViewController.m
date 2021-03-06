//
//  ViewController.m
//  02-按钮
//
//  Created by tom-pc on 15/9/26.
//  Copyright (c) 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

// 枚举类型本质上就是整数，定义的时候，如果只指定第一个数值，后续的数值依次递增
// 枚举类型是解决魔法数字比较常用的手法
typedef enum {
    kMovingTop = 10,
    kMovingBottom,
    kMovingLeft,
    kMovingRight,
} kMovingDir;

// 宏定义
// 解决魔法数值
#define kMovingDelta 50.0f



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconButton;

// 每次的形变累加
// 定义delta变量，使得每次调用Make方法时，将初始值累加。不会像传人数值一样，初始值是不变的。
@property (nonatomic, assign) CGFloat delta;

@end

@implementation ViewController


// 平移方法之一，transform，且按钮默认指向move方法。
- (IBAction)move1:(UIButton *)button
{
    self.delta -= 100.0;
    // CGAffineTransformMakeTranslation的位移形变是相对按钮的“初始”位置来变化的(self.delta的位置直接用数值来替代，移动的位置将只有一次，使用self.delta可以移动多次)
//    self.iconButton.transform = CGAffineTransformMakeTranslation(0, self.delta);
    
    
    
    
    
    
    CGFloat dx = 0, dy = 0;
    
    if (button.tag == kMovingTop || button.tag == kMovingBottom) {
        dy = (button.tag == kMovingTop) ? -kMovingDelta : kMovingDelta;
    }
    
    if (button.tag == kMovingLeft || button.tag == kMovingRight) {
        dx = (button.tag == kMovingLeft) ? -kMovingDelta : kMovingDelta;
    }

    
//    switch (button.tag) {
//        case kMovingTop:        // 上
//            dy = kMovingDelta;
//            break;
//        case kMovingBottom:        // 下
//            dy = kMovingDelta;
//            break;
//        case kMovingLeft:        // 左
//            dx = kMovingDelta;
//            break;
//        case kMovingRight:        // 右
//            dx = kMovingDelta;
//            break;
//    }

    
    
    
    
    
    
    
    
    
    // 对位移形变进行累加，是上一个方法的优化，就不需要定义成员变量delta
    self.iconButton.transform = CGAffineTransformTranslate(self.iconButton.transform, dx, dy);
    
    NSLog(@"%@", NSStringFromCGAffineTransform(self.iconButton.transform));
    
}

















// 平移方法之一center，且按钮默认指向move方法。
// 代码通过center位移
- (void)move:(UIButton *)button
{
    
    // 1.取出center
    CGPoint center = self.iconButton.center;
    
    // 2.根据按钮的类型，判断移动的方向，再修改结构体的成员
    // magic number魔法数字
    switch (button.tag) {
        case kMovingTop:        // 上
            center.y -= kMovingDelta;
            break;
        case kMovingBottom:        // 下
            center.y += kMovingDelta;
            break;
        case kMovingLeft:        // 左
            center.x -= kMovingDelta;
            break;
        case kMovingRight:        // 右
            center.x += kMovingDelta;
            break;
    }
    
    // 3.重新为对象的结构体属性赋值
    self.iconButton.center = center;
    
    NSLog(@"%@", NSStringFromCGRect(self.iconButton.frame));
}







// 2.(两种缩放)
//   通过bounds放大缩小
//   通过transform放大缩小
- (IBAction)zoom:(UIButton *)button
{
//    CGFloat scale = (button.tag) ? 1.2 : 0.8;
//    
//    // 累加，且等比例缩放
//    self.iconButton.transform = CGAffineTransformScale(self.iconButton.transform, scale, scale);
//    
//    
//    
//    NSLog(@"%@", NSStringFromCGAffineTransform(self.iconButton.transform));
    
    
    
    
    
    
    
    
    
    
    // 1.原始缩放
    // 提示：也可以通过center修改位置
    //1> 取出bounds
    CGRect bounds = self.iconButton.bounds;
    
    
    
    
    // 判断点了哪个按钮
    // 并用frame调整大小的缩放
    if (button.tag) {
        NSLog(@"放大");
        bounds.size.width += 20;
        bounds.size.height += 20;
    } else {
        NSLog(@"缩小");
        bounds.size.width -= 20;
        bounds.size.height -= 20;
    }
    
    
    /*
     首尾式动画
     =========
     1> 准备开始一个动画
     // [UIView beginAnimations:nil context:nil];
     2> 修改控件属性的代码，就可以实现动画
     3> 提交动画
     // [UIView commitAnimations];
     
     补充
     ====
     1> [UIView setAnimationDuration:1.0];
     设置动画执行的时长
     
     */
    
    // 3.首尾式动画
    [UIView beginAnimations:nil context:nil]; // 准备开始一个动画
    [UIView setAnimationDuration:1.0];
    
    
    // 3>重新设置bounds
    self.iconButton.bounds = bounds;
    
    // 提交动画
    [UIView commitAnimations];

}

















//// 2.1通过Frame调整大小
//- (void)zoomWithFrame:(UIButton *)button
//{
//    // 用frame调整按钮大小
//    //1. 取出frame
//    CGRect frame = self.iconButton.frame;
//    
//    
//    
//    
//    // 判断点了哪个按钮
//    // 并用frame调整大小的缩放
//    if (button.tag) {
//        NSLog(@"放大");
//        frame.size.width += 20;
//        frame.size.height += 20;
//    } else {
//        NSLog(@"缩小");
//        frame.size.width -= 20;
//        frame.size.height -= 20;
//    }
//    
//    // 3.重新为对象的结构体属性赋值
//    self.iconButton.frame = frame;
//}



// 旋转地设置
- (IBAction)rotate:(UIButton *)button
{
    CGFloat angle = (button.tag) ? -M_PI_4 : M_PI_4;
    
    // 在OC的开发中，统一都使用弧度制（π）,逆时针是负值，顺时针是正值
    // 180° = M_PI
    self.iconButton.transform = CGAffineTransformRotate(self.iconButton.transform, angle);
}



@end

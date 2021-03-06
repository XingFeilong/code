//
//  ViewController.m
//  Practice02
//
//  Created by tom-pc on 15/11/7.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    xMovingTop = 1,
    xMovingLeft,
    xMovingBottom,
    xMovingRight,
} xMoving;

#define xMovingPadding 20.0

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;

@end

@implementation ViewController

- (IBAction)move:(UIButton *)button{

    CGRect frame = self.iconButton.frame;
    
    switch (button.tag) {
        case xMovingTop:
            frame.origin.y -= xMovingPadding;
            break;
        case xMovingLeft:
            frame.origin.x -= xMovingPadding;
            break;
        case xMovingBottom:
            frame.origin.y += xMovingPadding;
            break;
        case xMovingRight:
            frame.origin.x += xMovingPadding;
            break;
        }
    self.iconButton.frame = frame;
}

//- (IBAction)topButton:(id)sender {
//    
//    CGRect frame = self.iconButton.frame;
//    
//    frame.origin.y -= 20;
//    self.iconButton.frame = frame;
//}
//- (IBAction)leftButton:(id)sender {
//    CGRect frame = self.iconButton.frame;
//    
//    frame.origin.x -= 20;
//    self.iconButton.frame = frame;
//}
//- (IBAction)bottomButton:(id)sender {
//    CGRect frame = self.iconButton.frame;
//    
//    frame.origin.y += 20;
//    self.iconButton.frame = frame;
//}
//- (IBAction)rightButton:(id)sender {
//    CGRect frame = self.iconButton.frame;
//    
//    frame.origin.x += 20;
//    self.iconButton.frame = frame;
//}

@end

//
//  ViewController.m
//  Practice
//
//  Created by tom-pc on 15/11/1.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"
#import "MessageCell.h"
#import "MessageFrameModel.h"

// 遵守UITableView的两个协议
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

// 声明可变数组属性，为了接收模型中的数组类方法
@property (nonatomic, strong) NSMutableArray *messageFrameModelList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

// 懒加载，实例化可变数组，接收模型数组的类方法
- (NSMutableArray *)messageFrameModelList
{
    if (_messageFrameModelList== nil) {
        _messageFrameModelList = [MessageFrameModel messageFrameModel];
    }
    return _messageFrameModelList;
}

// 取消状态栏的显示
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 取消cell的选中效果
    self.tableView.allowsSelection = NO;
    
    // 设置tableView背景色
    self.tableView.backgroundColor = [UIColor colorWithRed:200/225.0 green:200/225.0 blue:200/225.0 alpha:1.0];
    
    // 分隔线的去除
    self.tableView.separatorStyle = UITableViewCellAccessoryNone;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 返回数组的元素个数
    return self.messageFrameModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 类方法实例化cell
    MessageCell *cell = [MessageCell messageCellWithTableView:tableView];
    // 给cell设置内容位置，在相应的行
    cell.messageFrameModel = self.messageFrameModelList[indexPath.row];
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 给cell相应地行实例化模型
    MessageFrameModel *m = self.messageFrameModelList[indexPath.row];
    return  m.cellHeight;
}
@end

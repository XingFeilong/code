//
//  ContactsTableViewController.m
//  01-私人通讯录
//
//  Created by tom-pc on 15/11/14.
//  Copyright © 2015年 tom-pc. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "AddViewController.h"
#import "Contact.h"

@interface ContactsTableViewController ()<UIActionSheetDelegate, AddViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *contacts;
@end

@implementation ContactsTableViewController

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#warning 注销功能
// 点击注销就会调用这个方法
- (IBAction)loginOut:(id)sender {
    // 判断是否要真的注销
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
    // 回到登录界面
}
#pragma mark - ActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) return;
    // 回到登录界面
    [self.navigationController popViewControllerAnimated:YES];
    
}

// 逆传
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"_____%@", segue.destinationViewController);
//    
//    AddViewController *vc = segue.destinationViewController;
//    vc.contact = self;
//}
//- (void)setName:(NSString *)name phone:(NSString *)phone
//{
//    NSLog(@"%@--%@", name, phone);
//}

// 代理逆传
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"_____%@", segue.destinationViewController);
    
    AddViewController *vc = segue.destinationViewController;
    vc.delegate = self;
}
// 成功添加一个联系人的时候调用
- (void)addViewController:(AddViewController *)add didAddContact:(Contact *)contact
{
    // 保存数据
    [self.contacts addObject:contact];
    
    // 刷新表格
    [self.tableView reloadData];
    
    // 把数据展示到联系人界面
    NSLog(@"%@---%@", contact.name, contact.phone);
}


















#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}
// 返回行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"contact";
    // forIndexPath:indexPath 从storyboard中加载
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    // 取出数据，然后拿到模型。
    Contact *contact = self.contacts[indexPath.row];
    // 给cell 里面的控件赋值
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    
    // Configure the cell...
    
    return cell;
}

@end

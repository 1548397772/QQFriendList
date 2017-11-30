//
//  ViewController.m
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import "ViewController.h"
#import "FriendCell.h"
#import "GroupHeaderView.h"
#import "QQFriend.h"
#import "QQGroup.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,GroupHeaderViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, 375, 667 - 64) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [FriendCell cellWithTable:tableView];
    QQGroup *group = self.dataArray[indexPath.section];
    QQFriend *friend = group.friends[indexPath.row];
    cell.qqFriend = friend;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GroupHeaderView *headerView = [GroupHeaderView headerViewWithTableView:tableView];
    headerView.group = self.dataArray[section];
    headerView.delegate = self;
    return headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    QQGroup *group = self.dataArray[section];
    
    if (group.isOpen) {
        return group.friends.count;
    }
    else
    {
        return 0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.block) {
        NSLog(@"%@",cell.block());
    }
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray new];
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"]];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QQGroup *group = [QQGroup groupWithDict:dict];
            [tempArray addObject:group];
        }
        _dataArray = (NSArray *)tempArray;
    }
    return _dataArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapGroupHeaderView:(GroupHeaderView *)groupHeaderView
{
    [self.tableView reloadData];
}

@end

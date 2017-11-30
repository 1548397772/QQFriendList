//
//  GroupHeaderView.h
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQGroup.h"
@class GroupHeaderView;
@protocol GroupHeaderViewDelegate<NSObject>
- (void)tapGroupHeaderView:(GroupHeaderView *)groupHeaderView;
@end

@interface GroupHeaderView : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UIButton *GroupNameBtn;
@property(nonatomic,strong) QQGroup *group;
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@property(nonatomic,weak)id<GroupHeaderViewDelegate> delegate;
@end

//
//  GroupHeaderView.m
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import "GroupHeaderView.h"

@implementation GroupHeaderView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.GroupNameBtn addTarget:self action:@selector(tapNameBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.GroupNameBtn.imageView.contentMode = UIViewContentModeCenter;
    self.GroupNameBtn.clipsToBounds = NO;
}

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *headerID = @"headerID";
    GroupHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    if (!view) {
        view = [[NSBundle mainBundle] loadNibNamed:@"GroupHeaderView" owner:nil options:nil].lastObject;
        view.contentView.backgroundColor = [UIColor whiteColor];
    }
    return view;
}

- (void)setGroup:(QQGroup *)group
{
    _group = group;
    [self.GroupNameBtn setTitle:group.name forState:UIControlStateNormal];
    self.countLabel.text = [NSString stringWithFormat:@"%ld/%ld",group.online,self.group.friends.count];
}

- (void)tapNameBtn:(UIButton *)sender
{
    self.group.isOpen = !self.group.isOpen;
    if ([self.delegate respondsToSelector:@selector(tapGroupHeaderView:)]) {
        [self.delegate tapGroupHeaderView:self];
    }
}

- (void)didMoveToSuperview
{
    if (self.group.isOpen) {
        self.GroupNameBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    }else
    {
        self.GroupNameBtn.imageView.transform = CGAffineTransformIdentity;
    }
}


@end

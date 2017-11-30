//
//  FriendCell.m
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import "FriendCell.h"

@implementation FriendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTable:(UITableView *)tableView
{
    static NSString *ID = @"friendCellID";
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"FriendCell" owner:nil options:nil].lastObject;
    }
    return cell;
}

- (void)setQqFriend:(QQFriend *)qqFriend
{
    _qqFriend = qqFriend;
    self.iconImage.image = [UIImage imageNamed:qqFriend.icon];
    self.nameLabel.text = qqFriend.name;
    self.introLabel.text = qqFriend.intro;
    self.block = ^{
        return qqFriend.name;
    };
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

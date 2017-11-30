//
//  FriendCell.h
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QQFriend.h"
typedef NSString *(^myBlock)(void);
@interface FriendCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(nonatomic,strong) QQFriend *qqFriend;
@property(nonatomic,copy)myBlock block;

+ (instancetype)cellWithTable:(UITableView *)tableView;
@end

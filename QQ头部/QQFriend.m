//
//  QQFriend.m
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import "QQFriend.h"

@implementation QQFriend
+ (instancetype)firendWithDict:(NSDictionary *)dict
{
    QQFriend *friend = [[QQFriend alloc]init];
    friend.name = dict[@"name"];
    friend.intro = dict[@"intro"];
    friend.icon = dict[@"icon"];
    return friend;
}
@end

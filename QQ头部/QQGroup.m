//
//  QQGroup.m
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import "QQGroup.h"

@implementation QQGroup
+ (instancetype)groupWithDict:(NSDictionary *)dict
{
    QQGroup *group = [QQGroup new];
    group.name = dict[@"name"];
    group.online = [dict[@"online"] integerValue];
    group.friends = dict[@"friends"];
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in group.friends) {
        QQFriend *friend = [QQFriend firendWithDict:dict];
        [tempArray addObject:friend];
    }
    group.friends = tempArray;
    return group;
}

//- (instancetype)initWithDict:(NSDictionary *)dict
//{
//    if (self = [super init]) {
//        // 1.注入所有属性
//        [self setValuesForKeysWithDictionary:dict];
//        NSMutableArray *friendArray = [NSMutableArray array];
//        for (NSDictionary *dict in self.friends) {
//            QQFriend *friend = [QQFriend firendWithDict:dict];
//            [friendArray addObject:friend];
//        }
//        self.friends = friendArray;
//    }
//    return self;
//}
@end

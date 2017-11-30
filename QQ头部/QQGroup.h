//
//  QQGroup.h
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QQFriend.h"
@interface QQGroup : NSObject
@property(nonatomic,strong) NSArray<QQFriend *> *friends;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign) NSUInteger online;
+ (instancetype)groupWithDict:(NSDictionary *)dict;
@property(nonatomic,assign) BOOL isOpen;
@end

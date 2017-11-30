//
//  QQFriend.h
//  QQ头部
//
//  Created by BJyhc on 2017/11/30.
//  Copyright © 2017年 blue@circle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QQFriend : NSObject
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,copy)NSString *name;
+ (instancetype)firendWithDict:(NSDictionary *)dict;
@end

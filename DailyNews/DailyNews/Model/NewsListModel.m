//
//  NewsListModel.m
//  DailyNews
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "NewsListModel.h"

@implementation NewsListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([@"id" isEqualToString:key]) {
        self.Id = value;
    }
}


@end

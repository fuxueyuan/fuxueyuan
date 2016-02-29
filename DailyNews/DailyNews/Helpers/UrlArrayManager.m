//
//  UrlArrayManager.m
//  DailyNews
//
//  Created by 王辉 on 16/1/26.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "UrlArrayManager.h"
static UrlArrayManager *manager = nil;


@implementation UrlArrayManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[UrlArrayManager alloc] init];
    });
    return manager;
}

- (NSMutableArray *)urlDownPullArray {
    if (!_urlDownPullArray) {
        _urlDownPullArray = [NSMutableArray array];
    }
    return _urlDownPullArray;
}

- (NSMutableArray *)urlDownVideoArray {
    if (!_urlDownVideoArray) {
        _urlDownVideoArray = [NSMutableArray array];
    }
    return _urlDownVideoArray;
}

#pragma mark - 下拉获得新news的URL数组
- (void)getMoreUrlArray:(NSArray *)urlArray {
    //  头条
    NSString *str1 = [NSString stringWithFormat:urlArray[0], arc4random()%4 + 1];
    [self.urlDownPullArray addObject:str1];
    //  推荐
    NSString *str2 = [NSString stringWithFormat:urlArray[1], arc4random()%26 + 21];
    [self.urlDownPullArray addObject:str2];
    
    
    for (int i = 2; i < urlArray.count; i++) {
        [self.urlDownPullArray addObject:urlArray[i]];
    }
}

#pragma mark - 下拉获得新的video的URL数组
- (void)getMoreVideoUrlArray:(NSArray *)urlArray num:(NSInteger)number {
    [self.urlDownVideoArray removeAllObjects];
    number++;
    NSString *funnyUrl_1 = [NSString stringWithFormat:urlArray[0], number];
    
    [self.urlDownVideoArray addObject:funnyUrl_1];
    
    for (int i = 1; i < urlArray.count; i++) {
        [self.urlDownVideoArray addObject:[NSString stringWithFormat:urlArray[i], 1]];
    }

}
@end

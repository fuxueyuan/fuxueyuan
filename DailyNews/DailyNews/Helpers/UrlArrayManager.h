//
//  UrlArrayManager.h
//  DailyNews
//
//  Created by 王辉 on 16/1/26.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlArrayManager : NSObject

+ (instancetype)shareInstance;

- (void)getMoreUrlArray:(NSArray *)urlArray;

- (void)getMoreVideoUrlArray:(NSArray *)urlArray num:(NSInteger)number;

//  保存news下拉新URL的数组
@property (nonatomic, strong) NSMutableArray *urlDownPullArray;
//  保存video下拉新URL的数组
@property (nonatomic, strong) NSMutableArray *urlDownVideoArray;


@end

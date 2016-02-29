//
//  BodyTableViewController.h
//  DailyNews
//
//  Created by lanou3g on 16/1/24.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol sendUrlString <NSObject>
//
//- (void)getUrlString:(NSString *)urlString;
//
//@end

@interface BodyTableViewController : UITableViewController
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) NSString *urlString;
//@property (nonatomic, assign) id <sendUrlString>delegate;
@property (nonatomic, assign) NSInteger num;

//  接收一下每次更新后的URLString
@property (nonatomic, copy) NSString *ChangedUrlString;

//  记录每一个上拉URL更新的次数
@property (nonatomic, assign) int TouTiaoNum;
@property (nonatomic, assign) int TuiJianNum;
@property (nonatomic, assign) int YuLeNum;
@property (nonatomic, assign) int SportsNum;
@property (nonatomic, assign) int CaiJingNum;
@property (nonatomic, assign) int AutoNum;
@property (nonatomic, assign) int KeJiNum;
@property (nonatomic, assign) int news_funnyNum;
@property (nonatomic, assign) int BeiJingNum;

@end

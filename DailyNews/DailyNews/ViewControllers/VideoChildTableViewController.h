//
//  VideoChildTableViewController.h
//  DailyNews
//
//  Created by 王辉 on 16/1/28.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoChildTableViewController : UITableViewController
//  做为控制器的下标属性
@property (nonatomic, assign) NSInteger index;
//  记录笑Cry下拉次数
@property (nonatomic, assign) NSInteger num;
//  接受从VedioViewController传过来的button.tag  用来从数组中拿到对应的URL
@property (nonatomic, assign) NSInteger tag;

//  记录每个tableView下拉更新的次数
@property (nonatomic, assign) int funnyCryUpNum;
@property (nonatomic, assign) int zhengJingNum;
@property (nonatomic, assign) int loveHeartNum;
@property (nonatomic, assign) int baGuaNum;

//  接收一下每次更新后的URLString
@property (nonatomic, copy) NSString *ChangedUrlString;

@end

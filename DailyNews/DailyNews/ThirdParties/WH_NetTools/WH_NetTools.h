//
//  WH_NetTools.h
//  UILesson17_NetWorking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 王亚辉. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewsListModel.h"
typedef void(^DataBlock)(NSData *data);
typedef void(^ImageSolveBlock)(UIImage *image);
typedef void(^DictBlock)(NSDictionary *dictionary);
typedef void(^ModelArrayBlock)(NSMutableArray *array);
@interface WH_NetTools : NSObject
//  封装的旧方法
+ (void)solveDataWithUrl:(NSString *)StringUrl HttpMethod:(NSString *)method HttpBody:(NSString *)StringBody revokeBlock:(DataBlock)block;

//  新方法
//  如果是解析
+ (void)SessionDataWithUrl:(NSString *)StringUrl HttpMethod:(NSString *)method HtpBody:(NSString *)stringBody revokeBlock:(DictBlock)block;

//  如果是下载图片  都是GET方式
+ (void)SessionDownloadWithUrl:(NSString *)stringUrl revokeBlock:(ImageSolveBlock)block;

//  解析返回model的数组
+ (void)SessionModelDataWithUrl:(NSString *)StringUrl HttpMethod:(NSString *)method HtpBody:(NSString *)stringBody revokeBlock:(ModelArrayBlock)block;


@end

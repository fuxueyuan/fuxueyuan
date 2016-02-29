//
//  WH_NetTools.m
//  UILesson17_NetWorking2
//
//  Created by lanou3g on 15/12/29.
//  Copyright © 2015年 王亚辉. All rights reserved.
//

#import "WH_NetTools.h"

@implementation WH_NetTools

+ (void)solveDataWithUrl:(NSString *)StringUrl HttpMethod:(NSString *)method HttpBody:(NSString *)StringBody revokeBlock:(DataBlock)block {
    NSURL *url = [NSURL URLWithString:StringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    //  将所有的字母变成大写
    NSString *Smothod = [method uppercaseString];
    if ([@"POST" isEqualToString:Smothod]) {
        [request setHTTPMethod:Smothod];
        NSData *BodyData = [StringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:BodyData];
    } else if ([@"GET" isEqualToString:Smothod]) {
        
    } else {
//        NSLog(@"方法类型参数错误");
        @throw [NSException exceptionWithName:@"WH Param Error" reason:@"方法类型参数错误" userInfo:nil];
    }
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        block(data);
    }];
}

+ (void)SessionDataWithUrl:(NSString *)StringUrl HttpMethod:(NSString *)method HtpBody:(NSString *)stringBody revokeBlock:(DictBlock)block {
    NSURL *url = [NSURL URLWithString:StringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSString *Smothod = [method uppercaseString];
    if ([@"POST" isEqualToString:Smothod]) {
        [request setHTTPMethod:Smothod];
        NSData *dataBody = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:dataBody];
    } else if ([@"GET" isEqualToString:Smothod]) {
        
    } else {
        @throw [NSException exceptionWithName:@"WH Param Error" reason:@"方法类型参数错误" userInfo:nil];
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(dic);
        });
        
    }];
    [task resume];
}


//  新方法  异步里是多线程
+ (void)SessionDownloadWithUrl:(NSString *)stringUrl revokeBlock:(ImageSolveBlock)block {
    NSURL *url = [NSURL URLWithString:stringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    //  创建回话
    NSURLSession *session = [NSURLSession sharedSession];
    //  创建任务
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSData *imageData = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:imageData];
        //  从子线程回到子线程进行界面更新 (iOS中更新界面只能在主线程)
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
        
    }];
    [task resume];
}

//  解析返回model的数组
+ (void)SessionModelDataWithUrl:(NSString *)StringUrl HttpMethod:(NSString *)method HtpBody:(NSString *)stringBody revokeBlock:(ModelArrayBlock)block {
    NSMutableArray *modelArray = [NSMutableArray array];
    NSURL *url = [NSURL URLWithString:StringUrl];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSString *Smothod = [method uppercaseString];
    if ([@"POST" isEqualToString:Smothod]) {
        [request setHTTPMethod:Smothod];
        NSData *dataBody = [stringBody dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:dataBody];
    } else if ([@"GET" isEqualToString:Smothod]) {
        
    } else {
        @throw [NSException exceptionWithName:@"WH Param Error" reason:@"方法类型参数错误" userInfo:nil];
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSDictionary *dict = dic[@"data"];
        NSArray *arr = dict[@"list"];
        
        for (NSDictionary *dict_a in arr) {
            NewsListModel *model = [[NewsListModel alloc] init];
            [model setValuesForKeysWithDictionary:dict_a];
            //  将模型存储至数组
            [modelArray addObject:model];
            
            
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            block(modelArray);
        });
        
    }];
    [task resume];
}


@end

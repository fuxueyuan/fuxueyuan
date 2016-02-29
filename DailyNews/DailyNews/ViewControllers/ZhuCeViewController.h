//
//  ZhuCeViewController.h
//  DailyNews
//
//  Created by 王辉 on 16/1/29.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import <UIKit/UIKit.h>
//  讲注册成功的帐号返回至登录页面
typedef void (^sendUserInterface)(NSString *userName, NSString *userPsw);
@interface ZhuCeViewController : UIViewController
@property (nonatomic, copy) sendUserInterface block;
@end

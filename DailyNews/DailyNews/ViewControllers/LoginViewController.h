//
//  LoginViewController.h
//  UI作业3_
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 王亚辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
typedef void (^sendUserNameBlock)(NSString *fieldName);
@interface LoginViewController : UIViewController

@property (nonatomic, strong) LoginView *vi;
@property (nonatomic, copy) sendUserNameBlock nameBlock;
@end

//
//  LoginView.m
//  UI作业3_
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 王亚辉. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor cyanColor];
    
    //  设置登陆背景图
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.frame;
    
    [self addSubview:imageView];
    
    //  设置模糊版
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 324, 536)];
    view.backgroundColor = [UIColor colorWithRed:0.848 green:1.000 blue:0.926 alpha:0.3];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 20;
    
    [self addSubview:view];
    
    //  添加头像
    UIImage *image1 = [UIImage imageNamed:@"2.png"];
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
    imageView1.frame = CGRectMake(0, 0, 100, 100);
    imageView1.layer.masksToBounds = YES;
    imageView1.layer.cornerRadius = 50;
    imageView1.center = CGPointMake(212, 200);
    
    [self addSubview:imageView1];
    
    
    //  创建登陆视图框
    
    LTView *nameView = [[LTView alloc] initWithFrame:CGRectMake(0, 0, 210, 50)];
    nameView.center = CGPointMake(212, 350);
    
    nameView.lable.text = @" UserName:";
    self.nameV = nameView;
    [self addSubview:nameView];
    
    
    //  创建密码登陆视图
    LTView *passWord = [[LTView alloc] initWithFrame:CGRectMake(0, 0, 210, 50)];
    passWord.center = CGPointMake(212, 425);
    passWord.lable.text = @" Password";
    self.passW = passWord;
    [self addSubview:passWord];
    
    //  设置登陆按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(252, 500, 60, 40);
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 15;
    [button1 setTitle:@"登陆" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    button1.layer.borderWidth = 1;
    button1.layer.borderColor =[UIColor colorWithRed:0.753 green:1.000 blue:0.942 alpha:1.000].CGColor;
    
    self.loginButton = button1;
    [self addSubview:button1];
    
    
    //  设置注册按钮
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(112, 500, 60, 40);
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 15;
    [button2 setTitle:@"注册" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    button2.layer.borderWidth = 1;
    button2.layer.borderColor =[UIColor colorWithRed:0.753 green:1.000 blue:0.942 alpha:1.000].CGColor;
    
    self.zhuCeButton = button2;
    [self addSubview:button2];
    
    
    //  设置锁屏按钮
//    self.lockButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    self.lockButton.frame = CGRectMake(192, 500, 40, 40);
//    self.lockButton.layer.masksToBounds = YES;
//    self.lockButton.layer.cornerRadius = 20;
//    [self.lockButton setTitle:@"锁屏" forState:UIControlStateNormal];
//    [self.lockButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
//    self.lockButton.layer.borderWidth = 1;
//    self.lockButton.layer.borderColor =[UIColor colorWithRed:0.753 green:1.000 blue:0.942 alpha:1.000].CGColor;
//    [self addSubview:self.lockButton];
}


@end

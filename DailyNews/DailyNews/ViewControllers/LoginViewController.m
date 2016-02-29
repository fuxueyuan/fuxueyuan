//
//  LoginViewController.m
//  UI作业3_
//
//  Created by lanou3g on 15/12/9.
//  Copyright © 2015年 王亚辉. All rights reserved.
//

#import "LoginViewController.h"
#import "ZhuCeViewController.h"
#import <AVQuery.h>
@interface LoginViewController ()<UITextFieldDelegate>
{
    BOOL isExit;
    NSTimer *timer;
}
@end

@implementation LoginViewController

- (void)loadView {
    [super loadView];
    self.vi = [[LoginView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.vi;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //  1.接受协议
    //  2.设置代理
    self.vi.nameV.field.delegate = self;
    self.vi.passW.field.delegate = self;
    
    self.navigationItem.title = @"登陆";
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(returnAction)];
    self.navigationItem.leftBarButtonItem = left;

    //  登陆跳转页面
    [self.vi.loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    //  注册跳转页面
        [self.vi.zhuCeButton addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.hidden = YES;
}

#pragma mark - 登录
- (void)loginAction {
    AVQuery *query = [AVQuery queryWithClassName:@"UserInterface"];
    NSArray *userDataArray = [query findObjects];
    for (AVObject *user in userDataArray) {
        if ([[user objectForKey:@"userName"] isEqualToString:self.vi.nameV.field.text] && [[user objectForKey:@"userPsw"] isEqualToString:self.vi.passW.field.text]) {
            NSLog(@"ok");
            isExit = YES;
        }
    }
    if (isExit) {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertC animated:YES completion:nil];
        //  给alertC添加定时器
        self->timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dismissAlertAction) userInfo:alertC repeats:NO];
        
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名与密码不匹配" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"再次输入" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            self.vi.nameV.field.text = @"";
            self.vi.passW.field.text = @"";
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
    }
}

#pragma mark - alertC消失的方法
- (void)dismissAlertAction {
    UIAlertController *alert = [self->timer userInfo];
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert = nil;
    self.nameBlock(self.vi.nameV.field.text);
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 注册跳转
- (void)action:(UIButton *)sender {
    ZhuCeViewController *zvc = [[ZhuCeViewController alloc] init];
    zvc.block = ^void (NSString *userName, NSString *userPsw) {
        self.vi.nameV.field.text = userName;
        self.vi.passW.field.text = userPsw;
    };
    [self.navigationController pushViewController:zvc animated:YES];
}


#pragma mark - 返回
- (void)returnAction {
    [self.navigationController popViewControllerAnimated:YES];;
}

#pragma mark - 开始输入 vi的frame整体上移
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.vi.frame = CGRectMake(0, -100, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    return YES;
}


#pragma mark - 触摸收键盘  vi的frame还原
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.vi.nameV.field resignFirstResponder];
    [self.vi.passW.field resignFirstResponder];
    self.vi.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ZhuCeViewController.m
//  DailyNews
//
//  Created by 王辉 on 16/1/29.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "ZhuCeViewController.h"
#import <AVObject.h>
@interface ZhuCeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *userPswField;
@property (weak, nonatomic) IBOutlet UITextField *userPswAgainField;
@property (weak, nonatomic) IBOutlet UITextField *userEmailField;
@property (weak, nonatomic) IBOutlet UITextField *userPhoneNumField;
@property (nonatomic, strong) AVObject *post;
@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(zhuceAction)];
    self.navigationItem.rightBarButtonItem = right;

    //  创建保存用户信息的类
    self.post = [AVObject objectWithClassName:@"UserInterface"];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.hidden = YES;
}


- (void)zhuceAction {
    if (![self.userPswField.text isEqualToString:self.userPswAgainField.text]) {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次输入密码不同" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
    } else if ([self.userNameField.text isEqualToString:@""] | [self.userPswField.text isEqualToString:@""]) {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"输入框不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self saveZhuCeInterface];
            NSLog(@"gae");
            self.block(self.userNameField.text, self.userPswField.text);
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alertC addAction:action];
        [self presentViewController:alertC animated:YES completion:nil];

        
    }
}


- (void)saveZhuCeInterface {
   //    保存用户信息
    [self.post setObject:self.userNameField.text forKey:@"userName"];
    [self.post setObject:self.userPswField.text forKey:@"userPsw"];
    [self.post setObject:self.userPhoneNumField.text forKey:@"userPhoneNum"];
    [self.post setObject:self.userEmailField.text forKey:@"userEmail"];
    [self.post save];
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

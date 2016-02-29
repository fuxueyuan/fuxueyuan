//
//  detailWebViewController.m
//  DailyNews
//
//  Created by 王辉 on 16/1/27.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "detailWebViewController.h"

@interface detailWebViewController ()

@end

@implementation detailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.frame;
    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    webView.scalesPageToFit = YES;
    

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 隐藏导航栏
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
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

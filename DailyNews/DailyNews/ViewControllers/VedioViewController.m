//
//  VedioViewController.m
//  DailyNews
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "VedioViewController.h"
#import "VedioTableViewCell.h"
#import "VideoChildTableViewController.h"
#import "HeaderDefine.h"
#import "WH_NetTools.h"

@interface VedioViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIStackView *stackButtonView;
@property (weak, nonatomic) IBOutlet UIScrollView *videoScrollView;
@property (nonatomic, strong) UIButton *but;
@property (nonatomic, strong) VideoChildTableViewController *currentVC;

@property (nonatomic, strong) NSArray *UrlArray;

@end

@implementation VedioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.videoScrollView layoutIfNeeded];
    self.but = [self.stackButtonView subviews][0];
    [self.but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addChildTableViewController];
    
        // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - 添加子控制器
- (void)addChildTableViewController {
    for (int i = 0; i < 4; i++) {
        VideoChildTableViewController *childController = [[VideoChildTableViewController alloc] init];
        childController.index = i;
        [self addChildViewController:childController];
    }
    VideoChildTableViewController *childTableViewController = self.childViewControllers[0];    childTableViewController.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 44);
    [self.videoScrollView addSubview:childTableViewController.tableView];
    self.currentVC = childTableViewController;
    
}

#pragma mark - 切换子控制器
- (void)exchangeChildController:(UIButton *)sender {
    NSInteger n = sender.tag;
     [self transitionFromViewController:self.currentVC toViewController:self.childViewControllers[n] duration:0.5f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
         if (finished) {
             [self.currentVC.view removeFromSuperview];
             VideoChildTableViewController *childController = self.childViewControllers[n];
             childController.tableView.frame = CGRectMake(ScreenWidth * n, 0, ScreenWidth, ScreenHeight - 44);
             [self.videoScrollView addSubview:childController.tableView];
             self.currentVC = childController;
         }
     }];
}




#pragma mark - button响应事件
- (IBAction)buttonSelectAction:(UIButton *)sender {
    if (sender.tag == self.but.tag) {
        return;
    }
    
    VideoChildTableViewController *vc = self.childViewControllers[sender.tag];
    vc.tag = sender.tag;
    
    [UIView animateWithDuration:0.3f animations:^{
        [self.but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.but.transform = CGAffineTransformMakeScale(1, 1);
        self.videoScrollView.contentOffset = CGPointMake(ScreenWidth * sender.tag, 0);
        [self exchangeChildController:sender];

        sender.transform = CGAffineTransformMakeScale(1.3, 1.3);

        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }];
    
    self.but = sender;
    
    
    

}

#pragma mark - scrollView代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int k = self.videoScrollView.contentOffset.x / ScreenWidth;
    UIButton *button = [self.stackButtonView subviews][k];
    [self buttonSelectAction:button];
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

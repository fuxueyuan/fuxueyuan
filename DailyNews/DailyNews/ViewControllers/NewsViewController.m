//
//  NewsViewController.m
//  DailyNews
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "NewsViewController.h"
#import "HeaderDefine.h"
#import "BodyTableViewController.h"
@interface NewsViewController ()<UIScrollViewDelegate>




@property (weak, nonatomic) IBOutlet UIScrollView *listScrollView;

@property (weak, nonatomic) IBOutlet UIScrollView *bodyScrollView;

@property (nonatomic, strong) UIButton *but;

@property (weak, nonatomic) IBOutlet UIStackView *listContentView;

@property (nonatomic, strong) BodyTableViewController *currentVC;

@property (nonatomic, strong) NSArray *UrlArray;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.bodyScrollView layoutIfNeeded];
    
    self.UrlArray = @[TouTiao, TuiJian, YuLe, Sports, CaiJing, Auto, KeJi, news_funny, BeiJing];
    
    self.but = [self.listContentView subviews][0];
    [self.but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    

    
    [self addChildTableViewController];
    
    
    
    // Do any additional setup after loading the view.
}

#pragma mark - 隐藏导航栏
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;

}

#pragma mark - 添加子控制器
- (void)addChildTableViewController {
    for (int i = 0; i < 9; i++) {
        BodyTableViewController *btvc = [[BodyTableViewController alloc] init];
        btvc.index = i;
//        [self.listContentView subviews][i].tag = i;
    
//        btvc.view.frame = CGRectMake(ScreenWidth * i, 0, ScreenWidth, ScreenHeight - 44);
//        [self.bodyScrollView addSubview:btvc.view];
        [self addChildViewController:btvc];

    }
    
    BodyTableViewController *fbtvc = self.childViewControllers[0];
    fbtvc.tableView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight - 44);
    fbtvc.urlString = [NSString stringWithFormat:self.UrlArray[0],1];
    self.currentVC = fbtvc;
    [self.bodyScrollView addSubview:fbtvc.tableView];
}

#pragma mark 切换子视图控制器
- (void)changeChildViewController:(NSInteger)n {
    [self transitionFromViewController:self.currentVC toViewController:self.childViewControllers[n] duration:0.5f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
        if (finished) {
            [self.currentVC.view removeFromSuperview];
            BodyTableViewController *ChildVC = self.childViewControllers[n];
            ChildVC.tableView.frame = CGRectMake(ScreenWidth * n, 0, ScreenWidth, ScreenHeight - 44);
            [self.bodyScrollView addSubview:ChildVC.tableView];
            self.currentVC = ChildVC;
        }
    }];
    
    
}

#pragma mark - 新闻分类按钮响应事件
- (IBAction)buttonSelectAction:(UIButton *)sender {
//    if (self.but.tag == sender.tag) {
//        return;
//    }
    //  将被选中button的url tag  传到tableViewController
    BodyTableViewController *b = [self childViewControllers][sender.tag];
    b.num = sender.tag;
    b.urlString = [NSString stringWithFormat:self.UrlArray[sender.tag],1];
    
    // 切换子视图控制器
    [self changeChildViewController:sender.tag];
    
    //  动画改变字体的颜色
    [UIView animateWithDuration:0.3f animations:^{
        [self.but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.but.transform = CGAffineTransformMakeScale(1, 1);
        self.bodyScrollView.contentOffset = CGPointMake(ScreenWidth * sender.tag, 0);
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        sender.transform = CGAffineTransformMakeScale(1.3, 1.3);
        [self movingListScrollView:sender];

    }];

    
    
    self.but = sender;
    
    
}




#pragma mark - 拖动bodyScrollView button颜色随动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int k = self.bodyScrollView.contentOffset.x / ScreenWidth;
    UIButton *button = [self.listContentView subviews][k];
    [self buttonSelectAction:button];
}

#pragma mark - button栏偏移
- (void)movingListScrollView:(UIButton *)button {
    CGFloat offset = button.center.x - (self.listScrollView.frame.size.width * 0.5);
    if (offset < 0) {
        offset = 0;
    }
    CGFloat maxOffset = self.listScrollView.contentSize.width - self.listScrollView.frame.size.width;
    if (offset > maxOffset) {
        offset = maxOffset;
    }
    [self.listScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
   
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

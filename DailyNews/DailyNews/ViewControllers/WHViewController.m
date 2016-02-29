//
//  WHViewController.m
//  DailyNews
//
//  Created by 王辉 on 16/1/29.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "WHViewController.h"
#import "HeaderDefine.h"
#import "LoginViewController.h"
@interface WHViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *labelName;
@property (nonatomic, strong) UIButton *buttonCollect;
@property (nonatomic, strong) UIButton *buttonPinglun;
@property (nonatomic, strong) UIButton *buttonPresent;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation WHViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@[@"积分商城"], @[@"离线下载", @"夜间模式", @"头条推送", @"仅Wi-Fi下载图片", @"离线设置", @"正文字号", @"清除缓存"], @[@"反馈", @"关于", @"检查更新"]];
    
    [self loadData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //  给头像添加响应
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    self.headImage.userInteractionEnabled = YES;
    [self.headImage addGestureRecognizer:tap];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"WH_cell"];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)tapAction {
    LoginViewController *lvc = [[LoginViewController alloc] init];
    lvc.nameBlock = ^void (NSString *name) {
        self.labelName.text = name;
    };
    [self.navigationController pushViewController:lvc animated:YES];
}

#pragma mark - 分区个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}

#pragma mark 每个分区cell个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

#pragma mark 返回cell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WH_cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    if ((indexPath.section == 1) && (indexPath.row >= 1) && (indexPath.row <= 3)) {
        UISwitch *swicht_a = [[UISwitch alloc] initWithFrame:CGRectMake(ScreenWidth - 60, 10, 50, 25)];
        [cell addSubview:swicht_a];
    } else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma mark - 反悔cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark header高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}

#pragma mark - footer高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 15;
}

#pragma mark - 布局
- (void)loadData {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.tabBarController.tabBar.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    int height = 260;
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, height)];
    self.headerView.backgroundColor = [UIColor cyanColor];
    
    self.buttonCollect = [UIButton buttonWithType:UIButtonTypeSystem];
    self.buttonCollect.frame = CGRectMake(0, height - 50, ScreenWidth / 3, 50);
    [_buttonCollect setTitle:@"收藏" forState:UIControlStateNormal];
    [_headerView addSubview:_buttonCollect];
    
    self.buttonPinglun = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonPinglun.frame = CGRectMake(ScreenWidth / 3, height - 50, ScreenWidth / 3, 50);
    [_buttonPinglun setTitle:@"评论" forState:UIControlStateNormal];
    [_headerView addSubview:_buttonPinglun];
    
    self.buttonPresent = [UIButton buttonWithType:UIButtonTypeSystem];
    _buttonPresent.frame = CGRectMake(ScreenWidth / 3 * 2, height - 50, ScreenWidth / 3, 50);
    [_buttonPresent setTitle:@"礼品中心" forState:UIControlStateNormal];
    [_headerView addSubview:_buttonPresent];
    
    //  头像
    self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth / 2 - 40, 60, 80, 80)];
    _headImage.image = [UIImage imageNamed:@"placeholderImage"];
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = 40;
    [_headerView addSubview:_headImage];
    
    
    //  用户名
    self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, ScreenWidth, 21)];
    _labelName.textAlignment = NSTextAlignmentCenter;
    _labelName.font = [UIFont systemFontOfSize:13];
    _labelName.text = @"请点击头像登录";
    [_headerView addSubview:_labelName];
    
    _tableView.tableHeaderView = _headerView;

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

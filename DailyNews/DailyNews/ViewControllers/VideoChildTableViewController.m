//
//  VideoChildTableViewController.m
//  DailyNews
//
//  Created by 王辉 on 16/1/28.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "VideoChildTableViewController.h"
#import "VedioTableViewCell.h"
#import "HeaderDefine.h"
#import "WH_NetTools.h"
#import "UrlArrayManager.h"
#import "MJRefresh.h"
#import "detailWebViewController.h"
@interface VideoChildTableViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSArray *urlArray;
@property (nonatomic, strong) NSArray *urlMoreArray;
@property (nonatomic, strong) NSMutableArray *urlDownVideoArray;
@end

@implementation VideoChildTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNum];
    
    [self loadData];
    
    [self downRefresh];
    
    [self refresh];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"VedioTableViewCell" bundle:nil] forCellReuseIdentifier:@"VedioTableViewCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - 刷新
- (void)refresh {
    [self.tableView headerBeginRefreshing];
    [self.tableView footerBeginRefreshing];
    [self.tableView addHeaderWithTarget:self action:@selector(downRefresh)];
    [self.tableView addFooterWithTarget:self action:@selector(upRefresh)];
}

#pragma mark - 初始化
- (void)initNum {
    self.num = 1;
    self.urlArray = @[funnyCryDown, zhengJing, LoveHeart, baGua];
    self.urlMoreArray = @[funnyCryUp,  zhengJing, LoveHeart, baGua];

    self.funnyCryUpNum = 1;
    self.zhengJingNum = 1;
    self.loveHeartNum = 1;
    self.baGuaNum = 1;
}

#pragma mark - 下拉刷新
- (void)downRefresh {
    [self getDownArray];
    [WH_NetTools SessionModelDataWithUrl:self.urlDownVideoArray[self.tag] HttpMethod:@"get" HtpBody:nil revokeBlock:^(NSMutableArray *array) {
        [self.dataArray removeAllObjects];
        [self.dataArray addObjectsFromArray:array];
        [self.tableView reloadData];
    }];
    [self.tableView headerEndRefreshing];
}

#pragma mark 获得每一次下拉的URL数组
- (void)getDownArray {
    self.urlDownVideoArray = [NSMutableArray array];
    [[UrlArrayManager shareInstance] getMoreVideoUrlArray:self.urlArray num:self.num];
    [self.urlDownVideoArray addObjectsFromArray:[UrlArrayManager shareInstance].urlDownVideoArray];
}


#pragma mark - 上拉刷新
- (void)upRefresh {
    [self getUpArray];
    [WH_NetTools SessionModelDataWithUrl:self.ChangedUrlString HttpMethod:@"get" HtpBody:nil revokeBlock:^(NSMutableArray *array) {
        [self.dataArray addObjectsFromArray:array];
        [self.tableView reloadData];
    }];
}

#pragma mark 获得每一次上拉刷新对应的子控制器上的tableView增多的数据的URL
- (void)getUpArray {
    self.ChangedUrlString = nil;
    switch (self.tag) {
        case 0:
            self.ChangedUrlString = [NSString stringWithFormat:funnyCryUp, self.funnyCryUpNum];
            self.funnyCryUpNum++;
            break;
        case 1:
            self.ChangedUrlString = [NSString stringWithFormat:zhengJing, self.zhengJingNum];
            self.zhengJingNum++;
            break;
        case 2:
            self.ChangedUrlString = [NSString stringWithFormat:LoveHeart, self.loveHeartNum];
            self.loveHeartNum++;
            break;
        case 3:
            self.ChangedUrlString = [NSString stringWithFormat:baGua, self.baGuaNum];
            self.baGuaNum++;
            break;
            
        default:
            break;
    }
}

#pragma mark - 初始加载数据
- (void)loadData {
    self.dataArray = [NSMutableArray array];
        [WH_NetTools SessionModelDataWithUrl:[NSString stringWithFormat:self.urlArray[self.tag], 1] HttpMethod:@"get" HtpBody:nil revokeBlock:^(NSMutableArray *array) {
        [self.dataArray addObjectsFromArray:array];
        [self.tableView reloadData];
        }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VedioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VedioTableViewCell" forIndexPath:indexPath];
    NewsListModel *model = self.dataArray[indexPath.row];
    cell.videoModel = model;
    return cell;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 230;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsListModel *model = self.dataArray[indexPath.row];
    detailWebViewController *d = [[detailWebViewController alloc] init];
    d.urlStr = model.link;
    [self.navigationController pushViewController:d animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

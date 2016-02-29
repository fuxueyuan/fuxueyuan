//
//  BodyTableViewController.m
//  DailyNews
//
//  Created by lanou3g on 16/1/24.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "BodyTableViewController.h"
#import "HeaderDefine.h"
#import "WH_NetTools.h"
#import "TableViewCell_NonePic.h"
#import "TableViewCell_OnePic.h"
#import "TableViewCell_ThreePic.h"
#import "TableViewCell_bigPic.h"
#import "SDRefresh.h"
#import "UrlArrayManager.h"
#import "detailWebViewController.h"
#import "UIImageView+WebCache.h"


@interface BodyTableViewController ()<UIScrollViewDelegate>
//  用来存放解析后的模数组
@property (nonatomic, strong) NSMutableArray *dataArray;
//  第一次进入进入页面的URL数组
@property (nonatomic, strong) NSArray *urlArray;
//  下拉刷新的URL数组
@property (nonatomic, strong) NSMutableArray *urlDownPullArray;
//  上拉更新更多的URL数组
@property (nonatomic, strong) NSArray *urlArrayMore;
//  轮播图model数组个数
@property (nonatomic, assign) int n;
//  生命上拉刷新的属性  (应为下面方法分离了 在第二个方法里有用到了refreshFooter  干脆声明一个属性接受)
@property (nonatomic, weak) SDRefreshFooterView *refreshFooter;
//  记录table的header的轮播图偏移到第几个位置
@property (nonatomic, assign) NSInteger number;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIPageControl *page;

@property (nonatomic, strong) NSMutableArray *scrollViewArr;

@end

@implementation BodyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.urlArray = @[TouTiao, TuiJian, YuLe, Sports, CaiJing, Auto, KeJi, news_funny, BeiJing];
    self.urlArrayMore = @[TouTiaoMore, TuiJianMore, YuLeMore, SportsMore, CaiJingMore, AutoMore, KeJiMore, news_funnyMore, BeiJingMore];
    self.dataArray = [NSMutableArray array];
    
    
    
    
    [self loadData];
    [self urlDownPullAction];

    [self registerNibAction];
    
    
    [self refreshHeader];
    [self setFooter];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - 注册cell
- (void)registerNibAction {
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell_NonePic" bundle:nil] forCellReuseIdentifier:@"TableViewCell_NonePic"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell_OnePic" bundle:nil] forCellReuseIdentifier:@"TableViewCell_OnePic"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell_ThreePic" bundle:nil] forCellReuseIdentifier:@"TableViewCell_ThreePic"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell_bigPic" bundle:nil] forCellReuseIdentifier:@"TableViewCell_bigPic"];
}

#pragma mark - 初始化所有的记录num数
- (void)initNum {
    self.TouTiaoNum = 1;
    self.TuiJianNum = 47;
    self.YuLeNum = 2;
    self.SportsNum = 2;
    self.CaiJingNum = 2;
    self.AutoNum = 2;
    self.KeJiNum = 2;
    self.news_funnyNum = 2;
    self.BeiJingNum = 2;
}

#pragma mark -  取出所有下拉更新的接口放至新的数组中
- (void)urlDownPullAction {
    self.urlDownPullArray = [NSMutableArray array];
    [[UrlArrayManager shareInstance] getMoreUrlArray:self.urlArray];
    [self.urlDownPullArray addObjectsFromArray:[UrlArrayManager shareInstance].urlDownPullArray];
}


#pragma mark 下拉更新
- (void)refreshHeader {
    SDRefreshHeaderView *refreshHeader = [SDRefreshHeaderView refreshView];
    [refreshHeader addToScrollView:self.tableView isEffectedByNavigationController:NO];
    __weak SDRefreshHeaderView *weakRefreshHeader = refreshHeader;
    __weak typeof(self) weakSelf = self;
    refreshHeader.beginRefreshingOperation = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (weakSelf.urlString == nil) {
                weakSelf.urlString = [NSString stringWithFormat:TouTiao, 1];
            }
            
            [weakSelf.dataArray removeAllObjects];
            int a = (int)self.num;
            weakSelf.urlString = self.urlDownPullArray[a];
            
            [WH_NetTools SessionModelDataWithUrl:weakSelf.urlString HttpMethod:@"get" HtpBody:nil revokeBlock:^(NSMutableArray *array) {
                
                
                [weakSelf.dataArray addObjectsFromArray:array];
                [weakSelf.tableView reloadData];
                [weakRefreshHeader endRefreshing];
            }];
        });
    };
    
    [refreshHeader autoRefreshWhenViewDidAppear];
    
}

#pragma mark - 上拉更新
- (void)setFooter {
    SDRefreshFooterView *refreshFooter = [SDRefreshFooterView refreshView];
    [refreshFooter addToScrollView:self.tableView isEffectedByNavigationController:NO];
    [refreshFooter addTarget:self refreshAction:@selector(refreshFooterAction)];
    _refreshFooter = refreshFooter;
}

- (void)refreshFooterAction {
    [self selectSpendingUrlAction];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.ChangedUrlString == nil) {
            self.ChangedUrlString = [NSString stringWithFormat:TouTiaoMore, 1];
        }


        [WH_NetTools SessionModelDataWithUrl:self.ChangedUrlString HttpMethod:@"get" HtpBody:nil revokeBlock:^(NSMutableArray *array) {
            
            
            [self.dataArray addObjectsFromArray:array];
            [self.tableView reloadData];
            [self.refreshFooter endRefreshing];
        }];

    });
}


#pragma mark 判断当前index 选择对应的上拉URL的变化方式
- (void)selectSpendingUrlAction {
    self.ChangedUrlString = nil;
    switch (self.index) {
        case 0:
            self.TouTiaoNum += 1;
            self.ChangedUrlString =[NSString stringWithFormat:TouTiaoMore, self.TouTiaoNum];
            break;
        case 1:
            self.TuiJianNum += 20;
            self.ChangedUrlString =[NSString stringWithFormat:TuiJianMore, self.TuiJianNum];
            break;
        case 2:
            self.YuLeNum += 1;
            self.ChangedUrlString =[NSString stringWithFormat:YuLeMore, self.YuLeNum];
            break;
        case 3:
            self.SportsNum += 1;
            self.ChangedUrlString =[NSString stringWithFormat:SportsMore, self.SportsNum];
            break;
        case 4:
            self.CaiJingNum += 1;
            self.ChangedUrlString =[NSString stringWithFormat:CaiJingMore, self.CaiJingNum];
            break;
        case 5:
            self.AutoNum += 20;
            self.ChangedUrlString =[NSString stringWithFormat:AutoMore, self.AutoNum];
            break;
        case 6:
            self.KeJiNum += 1;
            self.ChangedUrlString =[NSString stringWithFormat:KeJiMore, self.KeJiNum];
            break;
        case 7:
            self.news_funnyNum += 1;
            self.ChangedUrlString =[NSString stringWithFormat:news_funnyMore, self.news_funnyNum];
            break;
        case 8:
            self.BeiJingNum += 1;
            self.ChangedUrlString =[NSString stringWithFormat:BeiJingMore, self.BeiJingNum];
            break;
            
        default:
            break;
    }
}

#pragma mark - 加载数据
- (void)loadData {
    
    if (self.urlString == nil) {
        self.urlString = [NSString stringWithFormat:TouTiao, 1];
        self.num = 0;
    }
    
    [self.dataArray removeAllObjects];
[WH_NetTools SessionModelDataWithUrl:self.urlString HttpMethod:@"get" HtpBody:nil revokeBlock:^(NSMutableArray *array) {
    [self addImageViewToLoopPic:array];

    [self.dataArray addObjectsFromArray:array];
    
    [self.tableView reloadData];
}];
    
}

#pragma mark 给轮播图添加图片
- (void)addImageViewToLoopPic:(NSMutableArray *)array {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth - 20, 200)];
    self.n = arc4random()%4 + 2;
    _scrollView.contentSize = CGSizeMake(ScreenWidth * self.n, 200);
    _scrollView.pagingEnabled = YES;
    self.scrollView.bounces = NO;
#pragma mark ------ 必须先初始化后才能指定代理 ------
    self.scrollView.delegate = self;
    for (int i = 0; i < self.n; i++) {
        NewsListModel *model = array[i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth * i, 0, ScreenWidth, 200)];
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [imageView addGestureRecognizer:tap];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.kpic] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200 - 20, ScreenWidth - 100 - 10, 20)];
        label.text = model.title;
        label.textColor = [UIColor redColor];
        [imageView addSubview:label];
        
        [self.scrollView addSubview:imageView];
    }
    
    
    self.tableView.tableHeaderView = _scrollView;
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(ScreenWidth - 100, 200 - 20, 100, 20)];
    self.page.numberOfPages = self.n;
    self.page.currentPage = 0;
    [self.tableView addSubview:self.page];


}

#pragma mark - 轮播图的轻拍的跳转响应
- (void)tapAction {
    NewsListModel *model = self.dataArray[self.number];
        detailWebViewController *dwvc = [[detailWebViewController alloc] init];
        dwvc.urlStr = model.link;
        [self.navigationController pushViewController:dwvc animated:YES];
}

#pragma mark 轮播图偏移
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
     self.number = self.scrollView.contentOffset.x / ScreenWidth;
    
    self.page.currentPage = self.number;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.dataArray.count - self.n;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsListModel *model = self.dataArray[indexPath.row + self.n];
    

    NSString *str = model.feedShowStyle;
    NSNumber *n = model.pics[@"total"];
    int a = [n intValue];
    //  根据图片类型  返回cell样式
    if ([str isEqualToString:@"big_img_show"]) {
        TableViewCell_bigPic *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell_bigPic" forIndexPath:indexPath];
        cell.bigPicModel = model;
        return cell;
    } else if ([model.feedShowStyle isEqualToString:@"common"] && (a <= 1)) {
        TableViewCell_OnePic *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell_OnePic" forIndexPath:indexPath];
        cell.onePicModel = model;
        return cell;

    } else if ([model.feedShowStyle isEqualToString:@"common"] && (a > 1)) {
        TableViewCell_ThreePic *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell_ThreePic" forIndexPath:indexPath];
        cell.ThreePicModel = model;
        return cell;

    } else {
        TableViewCell_NonePic *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell_NonePic" forIndexPath:indexPath];
        cell.listModel = model;
        return cell;

    }

    
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsListModel *model = self.dataArray[indexPath.row + self.n];
    
    NSString *str = model.feedShowStyle;
    NSString *n = model.pics[@"total"];
    int a = [n intValue];
    if ([str isEqualToString:@"big_img_show"]) {
        return 260;
    } else if ([model.feedShowStyle isEqualToString:@"common"] && (a == 1)) {
        return 100;
        
    } else if ([model.feedShowStyle isEqualToString:@"common"] && (a > 1)) {
        return 150;
        
    } else {
        return 100;
    }
}

#pragma mark - 跳转至详情
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    detailWebViewController *dwvc = [[detailWebViewController alloc] init];
    NewsListModel *model = self.dataArray[indexPath.row + self.n];
    dwvc.urlStr = model.link;
    [self.navigationController pushViewController:dwvc animated:YES];
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

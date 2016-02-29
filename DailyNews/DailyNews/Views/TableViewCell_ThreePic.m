//
//  TableViewCell_ThreePic.m
//  DailyNews
//
//  Created by 王辉 on 16/1/27.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "TableViewCell_ThreePic.h"
#import "NewsListModel.h"
#import "UIImageView+WebCache.h"
@interface TableViewCell_ThreePic ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imageLeft;

@property (weak, nonatomic) IBOutlet UIImageView *imageMid;

@property (weak, nonatomic) IBOutlet UIImageView *imageRight;

@property (weak, nonatomic) IBOutlet UILabel *picsNum;

@property (weak, nonatomic) IBOutlet UILabel *pingLunNum;
@end
@implementation TableViewCell_ThreePic

- (void)setThreePicModel:(NewsListModel *)ThreePicModel {
    _ThreePicModel = ThreePicModel;
    self.labelTitle.text = ThreePicModel.title;
    self.picsNum.text = [NSString stringWithFormat:@"%@张图", ThreePicModel.pics[@"total"]];
    self.pingLunNum.text = [NSString stringWithFormat:@"%@评论", ThreePicModel.pics[@"total"]];
    
    
    NSArray *picsArr = _ThreePicModel.pics[@"list"];
    NSString *picString_left = picsArr[0][@"kpic"];
    [self.imageLeft sd_setImageWithURL:[NSURL URLWithString:picString_left] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    NSString *picString_mid = picsArr[1][@"kpic"];
    [self.imageMid sd_setImageWithURL:[NSURL URLWithString:picString_mid] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    NSString *picString_right = picsArr[2][@"kpic"];
    [self.imageRight sd_setImageWithURL:[NSURL URLWithString:picString_right] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

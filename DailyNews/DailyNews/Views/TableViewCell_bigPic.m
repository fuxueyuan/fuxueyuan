//
//  TableViewCell_bigPic.m
//  DailyNews
//
//  Created by 王辉 on 16/1/27.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "TableViewCell_bigPic.h"
#import "NewsListModel.h"
#import "UIImageView+WebCache.h"

@interface TableViewCell_bigPic ()
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIImageView *bigPic;

@property (weak, nonatomic) IBOutlet UILabel *picsNum;

@end

@implementation TableViewCell_bigPic

- (void)setBigPicModel:(NewsListModel *)bigPicModel {
    _bigPicModel = bigPicModel;
    self.labelTitle.text = bigPicModel.title;
    NSString *picString = bigPicModel.kpic;
//    NSString *picString = picsArr[0][@"kpic"];
    [self.bigPic sd_setImageWithURL:[NSURL URLWithString:picString] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    self.picsNum.text = [NSString stringWithFormat:@"%@张图", bigPicModel.pics[@"total"]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

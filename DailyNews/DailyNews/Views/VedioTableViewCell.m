//
//  VedioTableViewCell.m
//  DailyNews
//
//  Created by 王辉 on 16/1/28.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "VedioTableViewCell.h"
#import "NewsListModel.h"
#import "UIImageView+WebCache.h"

@interface VedioTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelPingLun;

@end


@implementation VedioTableViewCell

- (void)setVideoModel:(NewsListModel *)videoModel {
    _videoModel = videoModel;
    NSNumber *playNum = videoModel.video_info[@"playnumber"];
    NSString *iamgePic = videoModel.kpic;
    self.labelTitle.text = videoModel.title;

    self.labelPingLun.text = [NSString stringWithFormat:@"%@播放", playNum];
    [self.videoImageView sd_setImageWithURL:[NSURL URLWithString:iamgePic] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

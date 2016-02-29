//
//  TableViewCell_OnePic.m
//  DailyNews
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "TableViewCell_OnePic.h"
#import "NewsListModel.h"
#import "UIImageView+WebCache.h"
@interface TableViewCell_OnePic ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelLongTitle;

@property (weak, nonatomic) IBOutlet UIImageView *picView;
@end

@implementation TableViewCell_OnePic

- (void)setOnePicModel:(NewsListModel *)onePicModel {
    _onePicModel = onePicModel;
    self.labelTitle.text = _onePicModel.title;
    self.labelLongTitle.text = _onePicModel.long_title;
    
    NSString *picString  = onePicModel.kpic;
    
    [self.picView sd_setImageWithURL:[NSURL URLWithString:picString] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    NSString *text = self.labelLongTitle.text;
    CGSize size = CGSizeMake(self.labelLongTitle.frame.size.width, 2000);
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    CGRect frame = self.labelLongTitle.frame;
    frame.size.height = rect.size.height;
    self.labelLongTitle.frame = frame;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

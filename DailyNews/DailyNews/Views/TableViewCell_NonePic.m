//
//  TableViewCell_NonePic.m
//  DailyNews
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import "TableViewCell_NonePic.h"
#import "NewsListModel.h"
@interface TableViewCell_NonePic ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelLongTitle;

@end


@implementation TableViewCell_NonePic

- (void)setListModel:(NewsListModel *)listModel {
    _listModel = listModel;
    self.labelTitle.text = listModel.title;
    self.labelLongTitle.text = listModel.long_title;
//    
//    NSString *text = self.labelLongTitle.text;
//    CGSize size = CGSizeMake(self.labelLongTitle.frame.size.width, 2000);
//    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
//    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
//    CGRect frame = self.labelLongTitle.frame;
//    frame.size.height = rect.size.height;
//    self.labelLongTitle.frame = frame;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

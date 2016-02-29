//
//  LTView.m
//  UI作业3_
//
//  Created by lanou3g on 15/12/10.
//  Copyright © 2015年 王亚辉. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    
    self.field = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, 200, CGRectGetMaxY(self.frame) - 10)];
    
    self.field.layer.masksToBounds = YES;
    self.field.layer.cornerRadius = 20;
    self.field.layer.borderWidth = 1;
    self.field.layer.borderColor = [UIColor colorWithRed:0.753 green:1.000 blue:0.942 alpha:1.000].CGColor;
    
    [self addSubview:self.field];
    
    self.lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, CGRectGetMaxY(self.frame) - 10)];
    
    self.lable.font = [UIFont systemFontOfSize:16];
    self.lable.layer.masksToBounds = YES;
    self.lable.layer.cornerRadius = (CGRectGetMaxY(self.frame) - 10) / 2;
    self.lable.textColor = [UIColor colorWithRed:0.364 green:0.362 blue:1.000 alpha:1.000];
    
    self.field.leftView = self.lable;
    self.field.leftViewMode = UITextFieldViewModeAlways;
    
    
    
}



@end

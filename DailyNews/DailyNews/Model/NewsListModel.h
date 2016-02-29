//
//  NewsListModel.h
//  DailyNews
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsListModel : NSObject

//  "id": "2841-94597-hdpic"
@property (nonatomic, copy) NSString *Id;

//  "title": "丑哭了 网友发起最丑雪人比赛"
@property (nonatomic, copy) NSString *title;

//  "long_title": "丑哭了 网友发起最丑雪人比赛"
@property (nonatomic, copy) NSString *long_title;

//  "source": "其他"
@property (nonatomic, copy) NSString *source;

//  "link": "http://photo.sina.cn/album_1_2841_94597.htm?ch=1&fromsinago=1"
@property (nonatomic, copy) NSString *link;

//  "pic": "http://r3.sinaimg.cn/10230/2016/0125/f6/d/63571331/auto.jpg"
@property (nonatomic, copy) NSString *pic;

//  "kpic": "http://l.sinaimg.cn/n/news/20160125/dLxi-fxnvhvu7043013.jpg/original.jpg"
@property (nonatomic, copy) NSString *kpic;

//  "intro": "据华西都市报微博消息，近日一场“史无前例”的寒潮侵袭全国大地，“冷”几乎成了全国网友的共同话题之一。在寒潮的影响下，全国很多地方开始下起了大"
@property (nonatomic, copy) NSString *intro;

//  "pubDate": 1453687450
@property (nonatomic, copy) NSString *pubDate;

//  "articlePubDate": 1453697708
@property (nonatomic, copy) NSString *articlePubDate;

//  "comments": "slidenews-album-2841-94597_1_sh__2841-94597-hdpic"
@property (nonatomic, copy) NSString *comments;

//  "pics": {
//  "total": 9,
//  "list": []
// },
@property (nonatomic, strong) NSDictionary *pics;

//  "feedShowStyle": "common"
@property (nonatomic, copy) NSString *feedShowStyle;

//  "category": "hdpic"
@property (nonatomic, copy) NSString *category;

//  "is_focus": true
@property (nonatomic, copy) NSString *is_focus;

//  "comment": 18
@property (nonatomic, copy) NSString *comment;

//   "comment_count_info": {
//               "qreply": 274,
//               "total": 353,
//               "show": 18,
//               "comment_status": 0,
//               "praise": 13,
//               "dispraise": 21
//               }
@property (nonatomic, strong) NSDictionary *comment_count_info;

@property (nonatomic, strong) NSDictionary *recommends;

//  视频的video
@property (nonatomic, strong) NSDictionary *video_info;


@end

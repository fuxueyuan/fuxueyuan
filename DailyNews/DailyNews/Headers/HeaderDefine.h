//
//  HeaderDefine.h
//  DailyNews
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 王亚辉. All rights reserved.
//

#ifndef HeaderDefine_h
#define HeaderDefine_h

#define ScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)
#pragma mark - 头条
//  头条url字符串
#define TouTiao @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=%d&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"
//  头条上拉更新更多Url字符串  times  自1开始 每次累加1
#define TouTiaoMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=%d&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&pull_direction=up&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"



#pragma mark - 推荐
#define TuiJian @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&offset=0&city=WMXX2971&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&length=20&uid=d99a7db784e77a2a&channel=news_tuijian"

//  下拉  第一次下拉offset = 47  以后每次下拉更新更多  offset加20
#define TuiJianMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&offset=%d&city=WMXX2971&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&length=20&uid=d99a7db784e77a2a&channel=news_tuijian"



#pragma mark - 娱乐
#define YuLe @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=1&uid=d99a7db784e77a2a&channel=news_ent"

//  第一次下拉更新  p = 2  以后每次累加1
#define YuLeMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=news_ent"


#pragma mark - 体育
#define Sports @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=1&uid=d99a7db784e77a2a&channel=news_sports"

//  第一次下拉更新   p=2  类加1
#define SportsMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=news_sports"

#pragma mark - 财经
#define CaiJing @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=1&uid=d99a7db784e77a2a&channel=news_finance"

//  第一次下拉更新   p = 2  以后每次累加1
#define CaiJingMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=news_sports"

#pragma mark - 汽车
#define Auto @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=1&resolution=1080*1920&uid=d99a7db784e77a2a&city_code=110100&channel=news_auto"


//  第一次下拉更新 p=2  以后每次累加1
#define AutoMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=news_finance"

#pragma mark - 科技
#define KeJi @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=1&uid=d99a7db784e77a2a&channel=news_tech"

//  第一次下拉更新  p=2  以后每次累加1
#define KeJiMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=news_tech"


#pragma mark - 搞笑
#define news_funny @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=1&uid=d99a7db784e77a2a&channel=news_funny"

//  第一次下拉更新 p=2  以后每次累加1
#define news_funnyMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=news_funny"


#pragma mark - 北京
#define BeiJing @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=1&uid=d99a7db784e77a2a&channel=local_beijing"

//  第一次下拉更新 p=2  以后每次累加1
#define BeiJingMore @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=local_beijing"


#pragma mark --------视频--------
#pragma mark - 笑Cry
//  下拉  times自1累加
#define funnyCryDown @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=auto&city=WMXX2971&pull_times=%d&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=video_video"


//  上拉刷新times 自1 累加
#define funnyCryUp @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=%d&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&pull_direction=up&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=video_video"

#pragma mark - 震惊  初始状态p=1  下拉不变  上拉p累加1
#define zhengJing @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=video_highlights"

#pragma mark - 暖心  初始状态p=1  下拉不变  上拉p累加1
#define LoveHeart @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=video_scene"

#pragma mark - 八卦  初始状态p=1  下拉不变  上拉p累加1
#define baGua @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&s=20&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&platfrom_version=6.0&user_uid=3086531867&loading_ad_timestamp=0&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&p=%d&uid=d99a7db784e77a2a&channel=video_funny"






#endif /* HeaderDefine_h */

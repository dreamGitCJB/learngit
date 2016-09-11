//
//  YMConst.h
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#ifndef YMConst_h
#define YMConst_h
typedef NS_ENUM(NSInteger,YMTopicType) {
        Selection = 4,// 精选
        Food = 14,// 美食
        Household = 16,// 家居
        Digital = 17,// 数码
        GoodThing = 13,// 美物
        Grocery = 22,// 杂货
};

typedef NS_ENUM(NSInteger,YMShareButtonType) {
         WeChatTimeline = 0,// 微信朋友圈
         WeChatSession = 1,// 微信好友
         Weibo = 2,// 微博
         QZone = 3,// QQ 空间
         QQFriends = 4,// QQ 好友
         CopyLink = 5,// 复制链接
};

typedef NS_ENUM(NSInteger,YMOtherLoginButtonType) {
    weiboLogin = 100,// 微信微博圈
    weChatLogin = 101,// 微信好友
    QQLogin = 102,// 微博
    PHONENUM = 103,//手机号
};

/**
 *  iid 未登录用户 id，只要安装了今日头条就会生成一个 iid
 *  可以在自己的手机上安装一个今日头条，然后通过 charles 抓取一下这个 iid，
 *  替换成自己的，再进行测试
 */

#define IID 5461547359
#define device_id 6337089857
/**
 *  第一次启动
 */
#define YMFirstLaunch @"YMFirstLaunch"
/**
 *  是否登录
 */
#define isLogin  @"isLogin"
/**
 *  code 码 200 操作成功
 */
#define RETURN_OK 200

/// RGBA的颜色设置
#define YMColor(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
/// tabBar 被点击的通知

#define YMTabBarDidSelectedNotification @"YMTabBarDidSelectedNotification"


#endif /* YMConst_h */

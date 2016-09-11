//
//  RBRequest.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "RBRequestTool.h"
#import "HomeTopTitle.h"


@implementation RBRequestTool
/**
 * 有多少条文章更新
 */
+ (void)loadArticleRefreshTip:(RequestResultHandler)resultHandler {
    [[RequestManager sharedInstance] GET:@"2/article/v39/refresh_tip/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        !resultHandler ?: resultHandler(responseObject , nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !resultHandler ?: resultHandler(nil, error.description);
    }];
}

/**
 *  获取首页顶部标题内容
 */

+ (void)loadHomeTitlesData:(RequestResultHandler)resultHandler {
    [[RequestManager sharedInstance] GET:@"article/category/get_subscribed/v1/?" parameters:[self gainParam] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
        NSMutableArray *members = [NSMutableArray array];
        if ([responseObject[@"message"] isEqual:@"success"]) {
            NSMutableArray *array = [responseObject[@"data"][@"data"] mutableCopy];
            NSDictionary *dict = @{ @"category" : @"__all__",
                                    @"concern_id" : @"",
                                    @"default_add" : @0,
                                    @"flags" : @0,
                                    @"icon_url" : @"",
                                    @"name" : @"推荐",
                                    @"tip_new" : @0,
                                    @"type" : @0,
                                    @"web_url" : @""};
            [array setObject:dict atIndexedSubscript:0];
            for (int i = 0; i < array.count; i++) {
                HomeTopTitle *homeTopTitle = [[HomeTopTitle alloc] initWithDictionary:array[i] error:nil];
                [members addObject:homeTopTitle];
            }
            !resultHandler ?: resultHandler(members, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !resultHandler ?: resultHandler(nil, error.description);
    }];
}


+ (NSMutableDictionary *)gainParam {
    NSDictionary *param = @{@"device_id": @device_id,
                            @"aid": @13,
                            @"iid": @IID};
    return [param mutableCopy];
}
@end

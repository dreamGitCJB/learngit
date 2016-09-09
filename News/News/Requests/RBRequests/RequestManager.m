//
//  RequestManager.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "RequestManager.h"
NSString *const BaseApiURL = @"http://lf.snssdk.com/";

@implementation RequestManager
+(instancetype)sharedInstance {
    static RequestManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[RequestManager alloc] initWithBaseURL:[NSURL URLWithString:BaseApiURL]];
        AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
        NSMutableSet *types = [[serializer acceptableContentTypes] mutableCopy];
        [types addObjectsFromArray:@[@"text/plain", @"text/html"]];
        serializer.acceptableContentTypes = types;
        instance.responseSerializer = serializer;
        [NSURLSessionConfiguration defaultSessionConfiguration].HTTPMaximumConnectionsPerHost = 1;
    });
    return instance;
}
@end

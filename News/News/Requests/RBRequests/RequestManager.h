//
//  RequestManager.h
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

extern NSString *const BaseApiURL;

@interface RequestManager : AFHTTPSessionManager
+ (instancetype)sharedInstance;

@end

//
//  RBRequestTool.h
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManager.h"

typedef void(^RequestResultHandler)(id object, NSString *msg);


@interface RBRequestTool : NSObject

+ (void)loadArticleRefreshTip:(RequestResultHandler)resultHandler;

+ (void)loadHomeTitlesData:(RequestResultHandler)resultHandler;

@end

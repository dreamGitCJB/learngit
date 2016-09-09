//
//  RBRequest.h
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef BOOL(^ParamsBlock)(id request);
typedef void(^RequestResultHandler)(id object, NSString *msg);

@protocol RequestProtocol <NSObject>

@required
- (void)request:(ParamsBlock)paramsBlock result:(RequestResultHandler)resultHandler;

@end

@interface RBRequest : NSObject


@end

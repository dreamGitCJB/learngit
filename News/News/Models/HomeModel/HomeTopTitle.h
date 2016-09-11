//
//  HomeTopTitle.h
//  News
//
//  Created by Apple on 16/9/11.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>
@interface HomeTopTitle :JSONModel
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *concern_id;
@property (nonatomic, assign) NSInteger default_add;
@property (nonatomic, assign) NSInteger flags;
@property (nonatomic, strong) NSString *icon_url;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger tip_new;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *web_url;

@end

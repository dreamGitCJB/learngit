//
//  ViewController.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "BeforeLoginViewController.h"
#import "YMTabBarController.h"

@interface BeforeLoginViewController ()

@end

@implementation BeforeLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)mobileButtonClick:(UIButton *)sender {
    
}
- (IBAction)wechatButtonClick:(UIButton *)sender {
    
}
- (IBAction)QQButtonClick:(UIButton *)sender {
    
}
- (IBAction)weiboButtonClick:(UIButton *)sender {
    
}
- (IBAction)enterButtonClick:(UIButton *)sender {
    YMTabBarController *tabbarController = [[YMTabBarController alloc] init];
    [[UIApplication sharedApplication].delegate window].rootViewController = tabbarController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

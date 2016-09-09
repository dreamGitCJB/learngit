//
//  YMNavigationController.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "YMNavigationController.h"

@interface YMNavigationController ()

@end

@implementation YMNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.barTintColor = [UIColor whiteColor];
    navBar.tintColor = YMColor(0, 0, 0, 0.7);
    navBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:17.f]};
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self viewControllers].count > 0) {
        [self setNavigationBarHidden:NO];
        viewController.hidesBottomBarWhenPushed = true;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"leftbackicon_sdk_login_16x16_"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationBack)];
    } else {
        [self setNavigationBarHidden:YES];
    }

    [super pushViewController:viewController animated:true];
}

- (void)navigationBack {
    [self popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

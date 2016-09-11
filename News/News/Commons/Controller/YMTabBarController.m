//
//  YMTabBarController.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "YMTabBarController.h"
#import "YMNavigationController.h"

@interface YMTabBarController ()

@end

@implementation YMTabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.selectedIndex = 2;
    [self addChildViewControllers];
    
    
    NSLog(@"%@",self.tabBarController.viewControllers);
    self.tabBarController.selectedViewController = [self.tabBarController.viewControllers objectAtIndex:3];
    [[UITabBar appearance] setTintColor:YMColor(245, 80, 83,1.0)];
//    self.tabBarController.selectedIndex = 0;
    // Do any additional setup after loading the view.
}


- (void)addChildViewControllers {
    [self addChildViewController:STOREYBOARD(@"Home", @"YMHomeView") title:@"首页" imageName:@"home_tabbar_22x22_" selectedImageName:@"home_tabbar_press_22x22_"];
    [self addChildViewController:STOREYBOARD(@"Video", @"YMVideoView") title:@"视屏" imageName:@"video_tabbar_22x22_" selectedImageName:@"video_tabbar_press_22x22_"];
    [self addChildViewController:STOREYBOARD(@"NewsCare", @"YMNewCareView") title:@"关注" imageName:@"newcare_tabbar_22x22_" selectedImageName:@"newcare_tabbar_press_22x22_"];
    [self addChildViewController:STOREYBOARD(@"Mine", @"YMMineView") title:@"我的" imageName:@"mine_tabbar_22x22_" selectedImageName:@"mine_tabbar_press_22x22_"];
}

- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title  imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childController.title = title;
    YMNavigationController *nav = [[YMNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:nav];
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

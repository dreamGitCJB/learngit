//
//  YMHomeViewController.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "YMHomeViewController.h"
#import "YMNewCareViewController.h"

@interface YMHomeViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *blurImageView;

@end

@implementation YMHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.selectedIndex = 2;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadWebView" object:nil];
    [RBRequestTool loadArticleRefreshTip:^(id object, NSString *msg) {
        
    }];
    [RBRequestTool loadHomeTitlesData:^(id object, NSString *msg) {
        
    }];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(0, 100, 100, 40);
    
    [button setTitle:@"btn" forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    _blurImageView.contentMode = UIViewContentModeScaleAspectFit;
//    _blurImageView.alpha = 0.5;
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    effectview.frame = CGRectMake(0, 0, 35, 25);
    
    [_blurImageView addSubview:effectview];
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    
//    button.frame = CGRectMake(10, 50, 100, 40);
//    
//    [button setTitle:@"btn" forState:UIControlStateNormal];
//    
//    [effectview.contentView addSubview:button];
//    self.tabBarController.selectedIndex = 0;
    
    // Do any additional setup after loading the view.
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

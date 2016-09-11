//
//  YMNewCareViewController.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "YMNewCareViewController.h"

@interface YMNewCareViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation YMNewCareViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
    

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initWebView];
    }
    return self;
}


- (void)viewWillLayoutSubviews {
    
}

+ (void)initialize
{
    if (self == [super class]) {
        
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.selectedIndex = 0;
    NSString *urlStr = @"http://is.snssdk.com/concern/v2/follow/list/?iid=5461547359&ac=WIFI&ssmix=a&aid=13&app_name=news_article&channel=App%20Store&device_platform=iphone&idfa=229AFF9A-9FF6-4003-B9F4-3507137176BA&os_version=9.3.4&vid=131CFB24-7ADB-4030-B778-3E4FF7D57660&openudid=d1b53a8420585093722195e780856c18771ece3b&device_type=iPhone%205S&ab_feature=z1&ab_group=z1&device_id=6337089857&ab_version=72383,81888,69419,79288&resolution=640*1136&ab_client=a1,b1,b7,f2,f7,e1&version_code=5.7.7";
    [_webView setUserInteractionEnabled:YES];//是否支持交互
    _webView.backgroundColor = [UIColor whiteColor];
    //[webView setDelegate:self];
    //    _webView.delegate=self;
    //    [_webView setOpaque:NO];//opaque是不透明的意思
    //    [_webView setScalesPageToFit:YES];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [_webView loadRequest:request];

    // Do any additional setup after loading the view.
}

- (void)initWebView {
    
}


-(void)webViewDidStartLoad:(UIWebView *)webView{
//    [activityIndicatorView startAnimating];
//    opaqueView.hidden = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
//    [activityIndicatorView startAnimating];
//    opaqueView.hidden = YES;
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

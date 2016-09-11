//
//  YMMineViewController.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "YMMineViewController.h"
#import "CircleView.h"

@interface YMMineViewController ()<UITableViewDelegate>
#define NavigationBarHight 0.f

#define ImageHight 180.0f
@property (strong, nonatomic) UIImageView *zoomImageView;//变焦图片做底层
@property (strong, nonatomic) CircleView *circleView;
@property (strong, nonatomic) UILabel *textLabel;//类似昵称UILabel
@end

@implementation YMMineViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)createHeadView {
    _zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wallpaper_profile_night.jpg"]];
    _zoomImageView.frame = CGRectMake(0, -ImageHight, self.view.frame.size.width, ImageHight);
    
    //contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    
    [self.tableView addSubview:_zoomImageView];
    
    //设置autoresizesSubviews让子类自动布局
    _zoomImageView.autoresizesSubviews = YES;
    
    _circleView = [[CircleView alloc] initWithFrame:CGRectMake(SCREENSIZE.width / 2 - 40 , ImageHight / 2 -40, 80, 80)];
    [_zoomImageView addSubview:_circleView];
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, ImageHight-40, SCREENSIZE.width, 20)];
    _textLabel.textColor = [UIColor whiteColor];
    _textLabel.text = @"登录推荐更精准";
    _textLabel.font = [UIFont systemFontOfSize:15.f];
    _textLabel.textAlignment = NSTextAlignmentCenter;
    _textLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
    [_zoomImageView addSubview:_textLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.tableView.contentInset = UIEdgeInsetsMake(ImageHight, 0, 50, 0);
    self.tableView.tableFooterView = [UIView new];

    [self createHeadView];
    // Do any additional setup after loading the view.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    if (y < -ImageHight) {
        CGRect frame = _zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _zoomImageView.frame = frame;
        CGFloat circle_y = - (y + ImageHight);
        _circleView.center = CGPointMake(SCREENSIZE.width / 2, (ImageHight + circle_y) / 2);
    }
    
}


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return 0;
//    }
//    return 20;
//}

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

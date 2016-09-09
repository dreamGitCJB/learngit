//
//  YMMineViewController.m
//  News
//
//  Created by chenjinbao on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "YMMineViewController.h"

@interface YMMineViewController ()<UITableViewDelegate>
#define NavigationBarHight 0.f

#define ImageHight 200.0f
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIImageView *zoomImageView;//变焦图片做底层

@property (strong, nonatomic) UIImageView *circleView;//类似头像的UIImageView
@property (strong, nonatomic) UILabel *textLabel;//类似昵称UILabel
@end

@implementation YMMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView.contentInset = UIEdgeInsetsMake(ImageHight-24, 0, 0, 0);

    _zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"wallpaper_profile.jpg"]];
    _zoomImageView.frame = CGRectMake(0, -ImageHight - 24, self.view.frame.size.width, ImageHight);
    
    //contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
    _zoomImageView.contentMode = UIViewContentModeScaleAspectFill;//重点（不设置那将只会被纵向拉伸）
    
    [_tableView addSubview:_zoomImageView];
    
    //设置autoresizesSubviews让子类自动布局
    _zoomImageView.autoresizesSubviews = YES;
    
    _circleView = [[UIImageView alloc]initWithFrame:CGRectMake(10, ImageHight-50, 40, 40)];
    _circleView.backgroundColor = [UIColor redColor];
    _circleView.layer.cornerRadius = 7.5f;
    _circleView.image = [UIImage imageNamed:@"wallpaper_profile"];
    _circleView.clipsToBounds = YES;
    _circleView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
    [_zoomImageView addSubview:_circleView];
    
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, ImageHight-40, 280, 20)];
    _textLabel.textColor = [UIColor whiteColor];
    _textLabel.text = @"namelabel";
    _textLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;//自动布局，自适应顶部
    [_zoomImageView addSubview:_textLabel];
    // Do any additional setup after loading the view.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat y = scrollView.contentOffset.y;//根据实际选择加不加上NavigationBarHight（44、64 或者没有导航条）
    if (y < -ImageHight) {
        CGRect frame = _zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height =  -y;//contentMode = UIViewContentModeScaleAspectFill时，高度改变宽度也跟着改变
        _zoomImageView.frame = frame;
    }
    
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

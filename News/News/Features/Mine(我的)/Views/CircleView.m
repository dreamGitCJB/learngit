//
//  CircleView.m
//  News
//
//  Created by Apple on 16/9/9.
//  Copyright © 2016年 homyu. All rights reserved.
//

#import "CircleView.h"
@interface CircleView()
@property (nonatomic, strong) CAGradientLayer   *gradientLayer;
@property (nonatomic, strong) CAShapeLayer      *shapeLayer;
@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        if ([[NSUserDefaults standardUserDefaults] boolForKey:isLogin]) {
            [self initIsLoginUI];
        } else {
            [self initUI];
        }
        
    }
    return self;
}

- (void)initIsLoginUI {
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, CGRectGetWidth(self.frame) - 6, CGRectGetHeight(self.frame) - 6)];
    [headImageView setClipsToBounds:YES];
    [headImageView.layer setCornerRadius:CGRectGetWidth(headImageView.frame) / 2];
    [self addSubview:headImageView];
    [self initShapeLayer];
}

- (void)initUI
{
    //self.layer.contents = (__bridge id)[UIImage imageNamed:@"bottom"].CGImage;
    UILabel *longinLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, 3, CGRectGetWidth(self.frame) - 6, CGRectGetHeight(self.frame) - 6)];
    [longinLabel setClipsToBounds:YES];
    longinLabel.numberOfLines = 2;
    longinLabel.backgroundColor = [UIColor whiteColor];
    longinLabel.text = @"登录\n注册";
    longinLabel.textAlignment = NSTextAlignmentCenter;
    [longinLabel.layer setCornerRadius:CGRectGetWidth(longinLabel.frame) / 2];
    [self addSubview:longinLabel];
    self.gradientLayer = [CAGradientLayer layer];
    
    self.gradientLayer.frame = self.bounds;
    self.gradientLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layer addSublayer:self.gradientLayer];
    
    NSMutableArray * hsbColors = [NSMutableArray array];
    for (int hue = 190; hue < 360; hue ++) {
        UIColor * color = [UIColor colorWithHue:hue /360.0 saturation:1. brightness:1. alpha:1];
        [hsbColors addObject:(__bridge id)color.CGColor];
    }
    
    self.gradientLayer.colors = hsbColors;
    //self.gradientLayer.contents = (__bridge id)[UIImage imageNamed:@"bottom_light"].CGImage;
    
    
    [self initShapeLayer];
    
    self.gradientLayer.mask = self.shapeLayer;
}

-(void )initShapeLayer
{
    //shapLayer  一定要有形状  一般跟 bezierPath 配合
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.bounds;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.fillMode = kCAFillModeForwards;
    self.shapeLayer.strokeColor = [UIColor cyanColor].CGColor;
    self.shapeLayer.lineWidth = 2.;
    
    self.shapeLayer.lineCap = kCALineCapRound;
    //如果开启了线边缘的圆帽 kCALineCapRound 效果 或者 squre效果  ， 就会在两个边缘额外绘制对应的效果图形 ，造成你的 间隔 距离 看起来变小很多
    [self.layer addSublayer:self.shapeLayer];
    CGFloat width = self.shapeLayer.lineWidth;
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(width, width, self.bounds.size.width -width*2, self.bounds.size.width - width*2)];
    
    self.shapeLayer.path = path.CGPath;
    
}
-(void)drawRect:(CGRect)rect {
    
}

@end

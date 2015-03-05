//
//  ViewController.m
//  DrawCircle
//
//  Created by Yeming on 13-8-27.
//  Copyright (c) 2013年 Yeming. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController ()
{
    CAShapeLayer *arcLayer;
    
    CAShapeLayer *grayLayer;

    BOOL _isIntroduceVC;
    NSInteger numberOfHeight;
    BOOL _isIos5;
    BOOL _isAnimation;
    BOOL _isPressButton;
    UILabel *label;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.backgroundColor = [UIColor clearColor];
    label.center = self.view.center;
    label.text = @"+1";
    label.font = [UIFont systemFontOfSize:50];
    label.textColor = [UIColor redColor];
    label.userInteractionEnabled = YES;
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(aaaaTap)];
    [label addGestureRecognizer:tap];
    
    [self intiUIOfView];
    self.view.backgroundColor=[UIColor whiteColor];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)aaaaTap
{
    [UIView animateWithDuration:2 animations:^{
        label.center = CGPointMake(320,0);
        label.alpha = 0;
    }completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];
}
-(void)intiUIOfView
{
 
    UIBezierPath *path=[UIBezierPath bezierPath];
    CGRect rect=[UIScreen mainScreen].applicationFrame;
    [path addArcWithCenter:CGPointMake(rect.size.width/2,rect.size.height/2-20) radius:100 startAngle:1.5*M_PI endAngle:3.5*M_PI clockwise:YES];
    arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;//46,169,230
    arcLayer.fillColor=[UIColor clearColor].CGColor;
    arcLayer.strokeColor=HexRGB(0xff16c50).CGColor;
    arcLayer.lineWidth=10;
    arcLayer.frame=self.view.frame;
    [self.view.layer addSublayer:arcLayer];
    [self drawLineAnimation:arcLayer];
    
    
}
-(void)drawLineAnimation:(CALayer*)layer
{
    //opacity strokeEnd
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=1;
    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [layer addAnimation:bas forKey:@"key"];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.frame;
    gradientLayer.colors = @[(__bridge id)HexRGB(0xff16c50).CGColor,(__bridge id)[UIColor whiteColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5,0);
    gradientLayer.endPoint = CGPointMake(1,0.5);
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.mask = arcLayer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  weekDemo
//
//  Created by catt on 14-9-16.
//  Copyright (c) 2014年 datang. All rights reserved.
//

#import "ViewController.h"
#import "aaaaddddd.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    UIView * weekView;
    UIButton *weekDay;
    UIView *monthView;
}
@end

@implementation ViewController


-(BOOL)shouldAutorotate{
    return YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIDeviceOrientationIsLandscape(interfaceOrientation));
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    weekView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 320, 60)];
    weekView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:weekView];
    for (int i =0; i<7; ++i) {
        weekDay = [UIButton buttonWithType:UIButtonTypeCustom];
        weekDay.tag = i+1;
        weekDay.selected = NO;
        weekDay.layer.masksToBounds = YES;
        weekDay.layer.cornerRadius = 21;
        weekDay.layer.borderWidth = 0.5;
        weekDay.layer.borderColor = [UIColor grayColor].CGColor;
        weekDay.backgroundColor = [UIColor whiteColor];
        weekDay.frame = CGRectMake(3+i*(44+1), 8, 44, 44);
        
        [weekDay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [weekDay addTarget:self action:@selector(weekDayClick:) forControlEvents:UIControlEventTouchUpInside];
        if (weekDay.tag==1) {
            [weekDay setTitle:@"周一" forState:UIControlStateNormal];
        }else if (weekDay.tag==2){
            [weekDay setTitle:@"周二" forState:UIControlStateNormal];
        }else if (weekDay.tag==3){
            [weekDay setTitle:@"周三" forState:UIControlStateNormal];
        }else if (weekDay.tag==4){
            [weekDay setTitle:@"周四" forState:UIControlStateNormal];
        }else if (weekDay.tag==5){
            [weekDay setTitle:@"周五" forState:UIControlStateNormal];
        }else if (weekDay.tag==6){
            [weekDay setTitle:@"周六" forState:UIControlStateNormal];
        }else if (weekDay.tag==7){
            [weekDay setTitle:@"周日" forState:UIControlStateNormal];
        }
        [weekView addSubview:weekDay];
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 500, 70, 20);
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(adddddddd:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    monthView = [[UIView alloc]initWithFrame:CGRectMake(0, weekView.frame.origin.y+weekView.frame.size.height+20, 320, 8+8+4+44*5)];
    monthView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:monthView];
    for (int i =0; i<31; ++i) {
        UIButton *monthDay = [UIButton buttonWithType:UIButtonTypeCustom];
        monthDay.tag = i+1;
        monthDay.selected = NO;
        monthDay.layer.masksToBounds = YES;
        monthDay.layer.cornerRadius = 21;
        monthDay.layer.borderWidth = 0.5;
        monthDay.layer.borderColor = [UIColor grayColor].CGColor;
        monthDay.backgroundColor = [UIColor whiteColor];
        if (i<7) {
        monthDay.frame = CGRectMake(3+i*(44+1), 8, 44, 44);
        }else if (i>6&&i<14){
        monthDay.frame = CGRectMake(3+(i-7)*(44+1), 8+1+44, 44, 44);
        }else if (i>13&&i<21){
            monthDay.frame = CGRectMake(3+(i-14)*(44+1), 8+2+44*2, 44, 44);
        }else if (i>20&&i<28){
            monthDay.frame = CGRectMake(3+(i-21)*(44+1), 8+3+44*3, 44, 44);
        }else if (i>27&&i<31){
            monthDay.frame = CGRectMake(3+(i-28)*(44+1), 8+4+44*4, 44, 44);
        }
        [monthDay setTitle:[NSString stringWithFormat:@"%d",monthDay.tag] forState:UIControlStateNormal];
        [monthDay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [monthDay addTarget:self action:@selector(monthDayClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [monthView addSubview:monthDay];
    }
    aaaaddddd * ad = [[aaaaddddd alloc]init];
    [self.view addSubview:ad];
}
-(void)adddddddd:(UIButton*)sender
{
    NSMutableArray *arr = [NSMutableArray array];
    NSMutableArray *month = [NSMutableArray array];

    for (UIView*btn in weekView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            UIButton *button =(UIButton*)btn;
            if (button.selected==YES) {
                [arr addObject:[NSString stringWithFormat:@"%d",button.tag]];
            }
        }
    }
    for (NSString*string in arr) {
        NSLog(@"********%@",string);
    }
    
    for (UIView*btn in monthView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            UIButton *button =(UIButton*)btn;
            if (button.selected==YES) {
                [month addObject:[NSString stringWithFormat:@"%d",button.tag]];
            }
        }
    }
    for (NSString*string in month) {
        NSLog(@"&&&&&&&&%@",string);
    }

}

-(void)weekDayClick:(UIButton*)sender
{
    UIButton * btn = (UIButton*)sender;
    if(btn.selected==NO){
        btn.selected=YES;

        btn.backgroundColor = [UIColor yellowColor];
    }else{
        btn.selected=NO;
        btn.backgroundColor = [UIColor whiteColor];

    }
}
-(void)monthDayClick:(UIButton*)sender
{
    UIButton * btn = (UIButton*)sender;
    if(btn.selected==NO){
        btn.selected=YES;
        
        btn.backgroundColor = [UIColor yellowColor];
    }else{
        btn.selected=NO;
        btn.backgroundColor = [UIColor whiteColor];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  DVLineChart
//
//  Created by Fire on 16/4/23.
//  Copyright © 2016年 Fire. All rights reserved.
//

#import "ViewController.h"
#import "DVLineChartView.h"
#import "UIView+Extension.h"
#import "UIColor+Hex.h"

@interface ViewController () <DVLineChartViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"3e4a59"];
    
    
    DVLineChartView *ccc = [[DVLineChartView alloc] init];
    [self.view addSubview:ccc];
    
    ccc.width = self.view.width;
    
    ccc.yAxisViewWidth = 52;
    
    ccc.numberOfYAxisElements = 5;
    
    ccc.delegate = self;
    ccc.pointUserInteractionEnabled = YES;
    
    ccc.yAxisMaxValue = 1000;
    
    ccc.pointGap = 50;
    
    ccc.showSeparate = YES;
    ccc.separateColor = [UIColor colorWithHexString:@"67707c"];
    
    ccc.textColor = [UIColor colorWithHexString:@"9aafc1"];
    ccc.backColor = [UIColor colorWithHexString:@"3e4a59"];
    ccc.axisColor = [UIColor colorWithHexString:@"67707c"];
    
    ccc.xAxisTitleArray = @[@"4.1", @"4.2", @"4.3", @"4.4", @"4.5", @"4.6", @"4.7", @"4.8", @"4.9", @"4.10", @"4.11", @"4.12", @"4.13", @"4.14", @"4.15", @"4.16", @"4.17", @"4.18", @"4.19", @"4.20", @"4.21", @"4.22", @"4.23", @"4.24", @"4.25", @"4.26", @"4.27", @"4.28", @"4.29", @"4.30"];
    
    
    ccc.x = 0;
    ccc.y = 100;
    ccc.width = self.view.width;
    ccc.height = 300;
    
    
    
    DVPlot *plot = [[DVPlot alloc] init];
    plot.pointArray = @[@300, @550, @700, @200, @370, @890, @760, @430, @210, @30, @300, @550, @700, @200, @370, @890, @760, @430, @210, @30, @300, @550, @700, @200, @370, @890, @760, @430, @210, @30];
    
    
    
    
    plot.lineColor = [UIColor colorWithHexString:@"2f7184"];
    plot.pointColor = [UIColor colorWithHexString:@"14b9d6"];
    plot.chartViewFill = YES;
    plot.withPoint = YES;
    
    
//    DVPlot *plot1 = [[DVPlot alloc] init];
//    plot1.pointArray = @[@100, @300, @200, @120, @650, @770, @240, @530, @10, @90, @100, @300, @200, @120, @650, @770, @240, @530, @10, @90, @100, @300, @200, @120, @650, @770, @240, @530, @10, @90];
//    
//    
//    plot1.lineColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
//    plot1.pointColor = [UIColor whiteColor];
//    plot1.chartViewFill = YES;
//    plot1.withPoint = YES;
    
    [ccc addPlot:plot];
//    [ccc addPlot:plot1];
    [ccc draw];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)lineChartView:(DVLineChartView *)lineChartView DidClickPointAtIndex:(NSInteger)index {
    
    NSLog(@"%ld", index);
    
}

@end

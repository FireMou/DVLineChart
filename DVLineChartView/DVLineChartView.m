//
//  DVLineChartView.m
//  DVLineChart
//
//  Created by Fire on 15/10/16.
//  Copyright © 2015年 DuoLaiDian. All rights reserved.
//

#import "DVLineChartView.h"
#import "DVXAxisView.h"
#import "DVYAxisView.h"
#import "UIView+Extension.h"

@interface DVLineChartView () <DVXAxisViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) DVXAxisView *xAxisView;
@property (strong, nonatomic) DVYAxisView *yAxisView;
@property (assign, nonatomic) CGFloat gap;

@end

@implementation DVLineChartView

- (NSMutableArray *)plots {
    
    if (_plots == nil) {
        _plots = [NSMutableArray array];
    }
    return _plots;
}

- (void)commonInit {
    
    // 初始化某些属性值
    self.xAxisTextGap = 10;
    self.yAxisTextGap = 10;
    self.pointGap = 60;
    self.axisColor = [UIColor blackColor];
    self.textColor = [UIColor blackColor];
    self.textFont = [UIFont systemFontOfSize:12];
    self.numberOfYAxisElements = 5;
    self.percent = NO;
    self.showSeparate = NO;
//    self.chartViewFill = YES;
    self.showPointLabel = YES;
    self.backColor = [UIColor whiteColor];
    self.pointUserInteractionEnabled = YES;
    self.index = -1;
    
    // 添加x轴与y轴视图
    DVYAxisView *yAxisView = [[DVYAxisView alloc] init];
    
    [self addSubview:yAxisView];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    DVXAxisView *xAxisView = [[DVXAxisView alloc] init];
    
    [scrollView addSubview:xAxisView];
    
    [self addSubview:scrollView];
    
    self.scrollView = scrollView;
    self.xAxisView = xAxisView;
    self.xAxisView.delegate = self;
    self.yAxisView = yAxisView;
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    
    // 1. 创建一个"轻触手势对象"
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    
    // 点击几次
    tap.numberOfTapsRequired = 2;
    [self.xAxisView addGestureRecognizer:tap];
    
    // 2. 捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture:)];
    [self.xAxisView addGestureRecognizer:pinch];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self == [super initWithFrame:frame]) {
        
        [self commonInit];
        
    }
    return self;
}

- (void)awakeFromNib {
    
    [self commonInit];
}

+ (instancetype)lineChartView {
    
    return [[self alloc] init];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    
}

- (void)addPlot:(DVPlot *)plot {
    
    if (plot == nil) return;
    if (plot.pointArray.count == 0) return;
    
    [self.plots addObject:plot];
    
}

- (void)draw {
    
    if (self.plots.count == 0) return;
    
    // 设置y轴视图的尺寸
    self.yAxisView.width = self.yAxisViewWidth;
    self.yAxisView.x = 0;
    self.yAxisView.height = self.height;
    self.yAxisView.y = 0;
    
    // 设置scrollView的尺寸
    self.scrollView.x = self.yAxisView.width;
    self.scrollView.y = 0;
    self.scrollView.width = self.width - self.scrollView.x;
    self.scrollView.height = self.height;
    
    // 设置x轴视图的尺寸
    self.xAxisView.x = 0;
    self.xAxisView.y = 0;
    self.xAxisView.height = self.scrollView.height;
    self.xAxisView.width = self.xAxisTitleArray.count * self.pointGap + 200;
    
    self.scrollView.contentSize = self.xAxisView.frame.size;
    
    self.gap = self.pointGap;
    
    // 给y轴视图传递参数
    self.yAxisView.xAxisTextGap = self.xAxisTextGap;
    self.yAxisView.yAxisTextGap = self.yAxisTextGap;
    self.yAxisView.textColor = self.textColor;
    self.yAxisView.textFont = self.textFont;
    self.yAxisView.percent = self.isPercent;
    self.yAxisView.axisColor = self.axisColor;
    self.yAxisView.numberOfYAxisElements = self.numberOfYAxisElements;
    self.yAxisView.yAxisMaxValue = self.yAxisMaxValue;
    self.yAxisView.backColor = self.backColor;
    [self.yAxisView draw];
    
    self.xAxisView.xAxisTitleArray = self.xAxisTitleArray;
    self.xAxisView.pointGap = self.pointGap;
    self.xAxisView.xAxisTextGap = self.xAxisTextGap;
    self.xAxisView.axisColor = self.axisColor;
    self.xAxisView.showSeparate = self.isShowSeparate;
    self.xAxisView.numberOfYAxisElements = self.numberOfYAxisElements;
    self.xAxisView.plots = self.plots;
    self.xAxisView.yAxisMaxValue = self.yAxisMaxValue;
//    self.xAxisView.chartViewFill = self.isChartViewFill;
    self.xAxisView.showPointLabel = self.isShowPointLabel;
    self.xAxisView.backColor = self.backColor;
    self.xAxisView.textFont = self.textFont;
    self.xAxisView.textColor = self.textColor;
    self.xAxisView.percent = self.isPercent;
    self.xAxisView.pointUserInteractionEnabled = self.isPointUserInteractionEnabled;
    self.xAxisView.separateColor = self.separateColor;
    [self.xAxisView draw];
    
    if (self.index < 0) {
        
        if (self.index * self.pointGap > self.scrollView.width * 0.5) {
            [self.scrollView setContentOffset:CGPointMake(self.index * self.pointGap - self.scrollView.width * 0.5 + self.pointGap * 0.8, 0) animated:YES];
        }else{
            
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    }
    
    
}

// 轻触手势监听方法
- (void)tapGesture:(UITapGestureRecognizer *)tap {
    
    self.pointGap = self.gap;
    
    if (self.xAxisView.width == self.scrollView.width) {
        [UIView animateWithDuration:0.25 animations:^{
            
            self.xAxisView.width = self.xAxisTitleArray.count * self.gap + 100;
            
        }];
        
        self.xAxisView.showTailAndHead = NO;
        
        self.xAxisView.pointGap = self.gap;
        
        self.scrollView.contentSize = CGSizeMake(self.xAxisView.width, 0);
        
    }else{
        
        self.xAxisView.showTailAndHead = YES;
        
        CGFloat scale = self.scrollView.width / (self.xAxisTitleArray.count * self.gap + 100);
        
        self.pointGap *= scale;
        
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.xAxisView.width = self.scrollView.width;
        }];
        
        self.xAxisView.pointGap = self.pointGap;
        
        self.scrollView.contentSize = CGSizeMake(self.xAxisView.width, 0);
    }
    
}

// 捏合手势监听方法
- (void)pinchGesture:(UIPinchGestureRecognizer *)recognizer
{
    if (recognizer.state == 3) {
        
        if (self.xAxisView.width <= self.scrollView.width) {
            
            CGFloat scale = self.scrollView.width / self.xAxisView.width;
            
            self.pointGap *= scale;
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.xAxisView.width = self.scrollView.width;
            }];
            
            self.xAxisView.showTailAndHead = YES;
            
            self.xAxisView.pointGap = self.pointGap;
            
        }else if (self.xAxisView.width >= self.xAxisTitleArray.count * self.gap + 100){
            
            [UIView animateWithDuration:0.25 animations:^{
                self.xAxisView.width = self.xAxisTitleArray.count * self.gap + 100;
                
            }];
            
            self.xAxisView.showTailAndHead = NO;
            
            self.pointGap = self.gap;
            
            self.xAxisView.pointGap = self.pointGap;
        }
    }else{
        
        
        self.xAxisView.width *= recognizer.scale;
        
        self.xAxisView.showTailAndHead = NO;
        
        self.pointGap *= recognizer.scale;
        self.xAxisView.pointGap = self.pointGap;
        recognizer.scale = 1.0;
        
    }
    
    self.scrollView.contentSize = CGSizeMake(self.xAxisView.width, 0);
}

- (void)xAxisView:(DVXAxisView *)xAxisView didClickButtonAtIndex:(NSInteger)index {
    
    if ([self.delegate respondsToSelector:@selector(lineChartView:DidClickPointAtIndex:)]) {
        [self.delegate lineChartView:self DidClickPointAtIndex:index];
    }
    
}
@end

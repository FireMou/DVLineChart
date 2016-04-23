//
//  DVLineChartView.h
//  DVLineChart
//
//  Created by Fire on 15/10/16.
//  Copyright © 2015年 DuoLaiDian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DVPlot.h"
@class DVLineChartView;

@protocol DVLineChartViewDelegate <NSObject>

@optional
- (void)lineChartView:(DVLineChartView *)lineChartView DidClickPointAtIndex:(NSInteger)index;

@end


@interface DVLineChartView : UIView

@property (weak, nonatomic) id<DVLineChartViewDelegate> delegate;

/**
 *  文字大小
 */
@property (strong, nonatomic) UIFont *textFont;
/**
 *  文字颜色
 */
@property (strong, nonatomic) UIColor *textColor;
/**
 *  x轴文字与坐标轴间隙
 */
@property (assign, nonatomic) CGFloat xAxisTextGap;
/**
 *  坐标轴颜色
 */
@property (strong, nonatomic) UIColor *axisColor;
/**
 *  x轴的文字集合
 */
@property (strong, nonatomic) NSArray *xAxisTitleArray;
/**
 *  点与点之间的间距
 */
@property (assign, nonatomic) CGFloat pointGap;


/**
 *  y轴文字与坐标轴间隙
 */
@property (assign, nonatomic) CGFloat yAxisTextGap;
/**
 *  y轴的最大值
 */
@property (assign, nonatomic) CGFloat yAxisMaxValue;
/**
 *  y轴分为几段(默认5)
 */
@property (assign, nonatomic) int numberOfYAxisElements;
/**
 *  y轴与左侧的间距
 */
@property (assign, nonatomic) CGFloat yAxisViewWidth;
/**
 *  y轴数值是否添加百分号
 */
@property (assign, nonatomic, getter=isPercent) BOOL percent;
/**
 *  是否显示点Label
 */
@property (assign, nonatomic, getter=isShowPointLabel) BOOL showPointLabel;
/**
 *  存放plot的数组
 */
@property (strong, nonatomic) NSMutableArray *plots;
/**
 *  是否显示横向分割线
 */
@property (assign, nonatomic, getter=isShowSeparate) BOOL showSeparate;

/**
 *  横向分割线的颜色
 */
@property (strong, nonatomic) UIColor *separateColor;

/**
 *  视图的背景颜色
 */
@property (strong, nonatomic) UIColor *backColor;
/**
 *  点是否允许点击
 */
@property (assign, nonatomic, getter=isPointUserInteractionEnabled) BOOL pointUserInteractionEnabled;
/**
 *  定位时的索引值
 */
@property (assign, nonatomic) NSInteger index;
/**
 *  快速创建lineChartView的方法
 */
+ (instancetype)lineChartView;

- (void)addPlot:(DVPlot *)plot;

- (void)draw;
@end

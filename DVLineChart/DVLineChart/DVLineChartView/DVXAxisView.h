//
//  DVXAxisView.h
//  DVLineChart
//
//  Created by Fire on 15/10/16.
//  Copyright © 2015年 DuoLaiDian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DVXAxisView;

@protocol DVXAxisViewDelegate <NSObject>

@optional
- (void)xAxisView:(DVXAxisView *)xAxisView didClickButtonAtIndex:(NSInteger)index;

@end


@interface DVXAxisView : UIView

@property (weak, nonatomic) id<DVXAxisViewDelegate> delegate;

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
 *  坐标点数组
 */
@property (strong, nonatomic) NSArray *plots;
/**
 *  点与点之间的间距
 */
@property (assign, nonatomic) CGFloat pointGap;
/**
 *  x轴的文字集合
 */
@property (strong, nonatomic) NSArray *xAxisTitleArray;
/**
 *  y轴分为几段
 */
@property (assign, nonatomic) int numberOfYAxisElements;
/**
 *  是否显示横向分割线
 */
@property (assign, nonatomic, getter=isShowSeparate) BOOL showSeparate;
/**
 *  横向分割线的颜色
 */
@property (strong, nonatomic) UIColor *separateColor;
/**
 *  y轴的最大值
 */
@property (assign, nonatomic) CGFloat yAxisMaxValue;
/**
 *  是否将颜色充满图表
 */
//@property (assign, nonatomic, getter=isChartViewFill) BOOL chartViewFill;
/**
 *  是否显示点Label
 */
@property (assign, nonatomic, getter=isShowPointLabel) BOOL showPointLabel;
/**
 *  视图的背景颜色
 */
@property (strong, nonatomic) UIColor *backColor;
/**
 *  横坐标平是否只显示首尾Label
 */
@property (assign, nonatomic, getter=isShowTailAndHead) BOOL showTailAndHead;
/**
 *  pointLabel是否添加百分号
 */
@property (assign, nonatomic, getter=isPercent) BOOL percent;
/**
 *  点是否允许点击
 */
@property (assign, nonatomic, getter=isPointUserInteractionEnabled) BOOL pointUserInteractionEnabled;

- (void)draw;
@end

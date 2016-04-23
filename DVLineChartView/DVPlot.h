//
//  DVPlot.h
//  DVLineChart
//
//  Created by Fire on 15/10/17.
//  Copyright © 2015年 DuoLaiDian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DVPlot : NSObject
/**
 *  线的颜色
 */
@property (strong, nonatomic) UIColor *lineColor;
/**
 *  坐标点数组
 */
@property (strong, nonatomic) NSArray *pointArray;

@property (strong, nonatomic) UIColor *pointColor;
@property (strong, nonatomic) UIColor *pointSelectedColor;
/**
 *  是否将颜色充满图表
 */
@property (assign, nonatomic, getter=isChartViewFill) BOOL chartViewFill;

@property (assign, nonatomic) BOOL withPoint;
@end

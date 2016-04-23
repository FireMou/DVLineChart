//
//  DVYAxisView.m
//  DVLineChart
//
//  Created by Fire on 15/10/16.
//  Copyright © 2015年 DuoLaiDian. All rights reserved.
//

#import "DVYAxisView.h"
#import "UIView+Extension.h"

@interface DVYAxisView ()

@property (strong, nonatomic) UIView *separate;

@end

@implementation DVYAxisView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // 垂直坐标轴
        UIView *separate = [[UIView alloc] init];
        
        self.separate = separate;
        
        [self addSubview:separate];
        
        self.textFont = [UIFont systemFontOfSize:12];
        
    }
    return self;
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
}

- (void)draw {
    
    self.backgroundColor = self.backColor;
    
    
    // 计算坐标轴的位置以及大小
    NSDictionary *attr = @{NSFontAttributeName : self.textFont};
    
    CGSize labelSize = [@"x" sizeWithAttributes:attr];
    
    self.separate.backgroundColor = self.axisColor;
    self.separate.x = self.width - 1;
    self.separate.width = 1;
    self.separate.y = 0;
    self.separate.height = self.height - labelSize.height - self.xAxisTextGap;
    
    // 为顶部留出的空白
    CGFloat topMargin = 50;
    
    // Label做占据的高度
    CGFloat allLabelHeight = self.height - topMargin - self.xAxisTextGap - labelSize.height;
    
    // Label之间的间隙
    CGFloat labelMargin = (allLabelHeight + labelSize.height - (self.numberOfYAxisElements + 1) * labelSize.height) / self.numberOfYAxisElements;
    
    
    
    // 移除所有的Label
    for (UILabel *label in self.subviews) {
        if ([label isKindOfClass:[UILabel class]]) {
            
            [label removeFromSuperview];
        }
    }
    
    // 当数值大于10万时，单位按万显示
//    if (self.yAxisMaxValue >= 100000) {
//        self.yAxisMaxValue = self.yAxisMaxValue / 10000;
//        
//        UILabel *label = [[UILabel alloc] init];
//        label.text = @"万/10k";
//        
//        label.font = self.textFont;
//        label.textColor = self.textColor;
//        
//        label.x = 0;
//        label.y = 0;
//        label.height = labelSize.height;
//        label.width = self.width - 1 - self.yAxisTextGap;
//        
//        [self addSubview:label];
//    }
    
    // 添加Label
    for (int i = 0; i < self.numberOfYAxisElements + 1; i++) {
        UILabel *label = [[UILabel alloc] init];
        CGFloat avgValue = self.yAxisMaxValue / (self.numberOfYAxisElements);
        if (self.isPercent) {
            label.text = [NSString stringWithFormat:@"%.0f%%", avgValue * i];
        }else{
            label.text = [NSString stringWithFormat:@"%.0f", avgValue * i];
        }
        
        label.textAlignment = NSTextAlignmentRight;// UITextAlignmentRight;
        label.font = self.textFont;
        label.textColor = self.textColor;
        
        label.x = 0;
        label.height = labelSize.height;
        label.y = self.height - labelSize.height - self.xAxisTextGap - (label.height + labelMargin) * i - label.height/2;
        label.width = self.width - 1 - self.yAxisTextGap;
        [self addSubview:label];
    }
    
    
    
    // 设置Label的位置和大小
//    for (int i = 0; i < self.subviews.count; i++) {
//        
//        UIView *view = self.subviews[i];
//        
//        if ([view isKindOfClass:[UILabel class]]) {
//            
//            
//        }
//        
//    }
    
//    [self setNeedsLayout];
    
}
@end

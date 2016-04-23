//
//  DVPlot.m
//  DVLineChart
//
//  Created by Fire on 15/10/17.
//  Copyright © 2015年 DuoLaiDian. All rights reserved.
//

#import "DVPlot.h"

@implementation DVPlot

- (instancetype)init {
    
    if (self = [super init]) {
        self.lineColor = [UIColor blackColor];
        self.pointColor = [UIColor blackColor];
        self.pointSelectedColor = [UIColor orangeColor];
    }
    return self;
}

@end

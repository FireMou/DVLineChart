# DVLineChart
A Simple ChartView For Simple data statistics
![img](http://d.pr/i/1arn4+ "img")

简单描述
---------------------
这是一个使用时比较简单的一个图表，可以自定义多个属性，可以滚动显示图表，并且支持“点”的点击事件，双击缩小，变大，缩放。字体、颜色、间隙这些属性就不给大家介绍了，介绍些其他属性的作用，若有疑问，可以参照Demo

####x轴数据<DVLineChartView.h>

```
/**
 *  x轴的文字集合
 */
@property (strong, nonatomic) NSArray *xAxisTitleArray;


```
* x轴的数据就是从上面的数组属性中取出的

####y轴数据<DVLineChartView.h>

```
/**
 *  y轴的最大值
 */
@property (assign, nonatomic) CGFloat yAxisMaxValue;
/**
 *  y轴分为几段(默认5)
 */
@property (assign, nonatomic) int numberOfYAxisElements;


```
* y轴的数据是由y轴的一个最大值和y轴需要分为几段来确定的

####坐标点数据<DVPlot.h>

```
/**
 *  坐标点数组
 */
@property (strong, nonatomic) NSArray *pointArray;
/**
 *  是否将颜色充满图表
 */
@property (assign, nonatomic, getter=isChartViewFill) BOOL chartViewFill;


```
* 坐标点是通过上面这个数组中的数据来画出来的
* 下面的BOOL值代表的是“是否要给图表下面填充颜色”

####设置图表背景颜色

```

/**
 *  视图的背景颜色
 */
@property (strong, nonatomic) UIColor *backColor;


```
####横向分割线是否显示(横向分割线颜色)<DVLineChartView.h>

```
/**
 *  是否显示横向分割线
 */
@property (assign, nonatomic, getter=isShowSeparate) BOOL showSeparate;

/**
 *  横向分割线的颜色
 */
@property (strong, nonatomic) UIColor *separateColor;
```
####是否显示坐标点处的文字

```

/**
 *  是否显示点Label
 */
@property (assign, nonatomic, getter=isShowPointLabel) BOOL showPointLabel;
```
####坐标点是否添加点击事件

```

/**
 *  点是否允许点击
 */
@property (assign, nonatomic, getter=isPointUserInteractionEnabled) BOOL pointUserInteractionEnabled;


@property (weak, nonatomic) id<DVLineChartViewDelegate> delegate;


@protocol DVLineChartViewDelegate <NSObject>

@optional
- (void)lineChartView:(DVLineChartView *)lineChartView DidClickPointAtIndex:(NSInteger)index;

@end
```
####这个图表框架可以支持多条线
![img](http://d.pr/i/Mg2a+ "img")

```

/**
 *  存放plot的数组
 */
@property (strong, nonatomic) NSMutableArray *plots;

- (void)addPlot:(DVPlot *)plot;
```
* 通过上面的方法和属性可以画出多条线出来

####我们可以通过一个索引值来对图表进行定位

```
/**
 *  定位时的索引值
 */
@property (assign, nonatomic) NSInteger index;
```
* 当 index<0 时，无法进行定位

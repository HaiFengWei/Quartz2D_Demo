//
//  DrawView.m
//  Quartz2D
//
//  Created by haifeng on 2017/4/27.
//  Copyright © 2017年 meilikeji. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


- (void)drawRect:(CGRect)rect {
    // 画线条
//    [self drawLineWithRect:rect];
    
    // 画三角形
//    [self drawTriangleWithRect:rect];
    
    // 画矩形
//    [self drawSquaresWithRect:rect];
    
    // 画椭圆
//    [self drawEllipseWithRect:rect];
    
    // 画椭圆
    [self drawArcWithRect:rect];
    
}


#pragma mark -
#pragma mark - DrawLine
- (void)drawLineWithRect:(CGRect)rect {
    // 1.取得和当前视图相关联的图形上下文(因为图形上下文决定绘制的输出目标)/
    // 如果是在drawRect方法中调用UIGraphicsGetCurrentContext方法获取出来的就是Layer的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();//不需要*,同id
    
    // 2.绘图(绘制直线), 保存绘图信息
    // 设置起点
    CGContextMoveToPoint(context, 20, 100);
    //设置终点
    CGContextAddLineToPoint(context, 300, 100);
    
    /**  设置绘图的状态  **/
    //设置笔触颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
    //设置线条的宽度
    CGContextSetLineWidth(context, 15);
    //设置顶点样式
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置连接点样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //3.渲染（绘制出一条空心的线）
    CGContextStrokePath(context);
    //注意线条不能渲染为实心的
    //    CGContextFillPath(ctx);
    //设置第二条线
    //设置第二条线的起点
    CGContextMoveToPoint(context, 50, 200);
    //设置第二天线的终点(自动把上一条直线的终点当做起点)
    CGContextAddLineToPoint(context, 50, 60);
    
    /**  设置绘图的状态  **/
    //    CGContextSetRGBStrokeColor(ctx, 1.0, 0.7, 0.3, 1.0);
    //第二种设置颜色的方式
    [[UIColor grayColor] set];
    //设置线条的宽度
    CGContextSetLineWidth(context, 10);
    //设置线条的起点和终点的样式
    CGContextSetLineCap(context, kCGLineCapButt);
    
    //渲染第二条线的图形到view上
    //绘制一条空心的线
    CGContextStrokePath(context);

}

#pragma mark -
#pragma mark - DrawTriangle
- (void)drawTriangleWithRect:(CGRect)rect {
    //1.获得图形上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //2.绘制路径（相当于前面创建路径并添加路径到图形上下文两步操作）
    CGContextMoveToPoint(context, 50, 150);
    CGContextAddLineToPoint(context, 50, 300);
    CGContextAddLineToPoint(context, 250, 275);
    //封闭路径:a.创建一条起点和终点的线,不推荐
    //CGPathAddLineToPoint(path, nil, 20, 50);
    //封闭路径:b.直接调用路径封闭方法
    CGContextClosePath(context);
    
    /*设置线段样式
     phase:虚线开始的位置
     lengths:虚线长度间隔（例如下面的定义说明第一条线段长度8，然后间隔3重新绘制8点的长度线段，当然这个数组可以定义更多元素）
     count:虚线数组元素个数,即lengths元素个数
     */
    CGFloat lengths[2] = { 18, 9 };
    CGContextSetLineDash(context, 0, lengths, 2);

    //3.设置图形上下文属性
    [[UIColor redColor] setStroke];//设置红色边框
    [[UIColor greenColor] setFill];//设置绿色填充
    //[[UIColor blueColor]set];//同时设置填充和边框色
    
    /*CGPathDrawingMode是填充方式,枚举类型
     kCGPathFill:只有填充（非零缠绕数填充），不绘制边框
     kCGPathEOFill:奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）
     kCGPathStroke:只有边框
     kCGPathFillStroke：既有边框又有填充
     kCGPathEOFillStroke：奇偶填充并绘制边框
     */
    //4.绘制路径
    CGContextDrawPath(context, kCGPathEOFillStroke);
}

#pragma mark -
#pragma mark - DrawSquares
- (void)drawSquaresWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //添加矩形对象
    CGRect SquaresRect =CGRectMake(20, 50, 280.0, 50.0);
    CGContextAddRect(context,SquaresRect);
    // 如果要设置绘图的状态必须在渲染之前
    //    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1.0);
    // 绘制什么类型的图形(空心或者实心).就要通过什么类型的方法设置状态
    //    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
    
    // 调用OC的方法设置绘图的颜色
    //    [[UIColor purpleColor] setFill];
    //    [[UIColor blueColor] setStroke];
    // 调用OC的方法设置绘图颜色(同时设置了实心和空心)
    //    [[UIColor greenColor] set];
    [[UIColor colorWithRed:1.0 green:0 blue:0 alpha:1.0] set];
    //3.渲染图形到layer上
    //空心的
    CGContextStrokePath(context);
    //实心的
    //    CGContextFillPath(ctx);
    
    //设置属性
    
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

#pragma mark -
#pragma mark - DrawSquares
-(void)drawEllipseWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //添加对象,绘制椭圆（圆形）的过程也是先创建一个矩形
    CGRect ellipserect =CGRectMake(50, 50, 220.0, 300.0);// 若形成正方形则为圆形
    CGContextAddEllipseInRect(context, ellipserect);
    //设置属性
    [[UIColor orangeColor] set];
    //绘制
    CGContextDrawPath(context, kCGPathStroke);
}

#pragma mark -
#pragma mark - DrawArc
-(void)drawArcWithRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    /*添加弧形对象
     x:中心点x坐标
     y:中心点y坐标
     radius:半径
     startAngle:起始弧度
     endAngle:终止弧度
     closewise:是否逆时针绘制，0则顺时针绘制
     */
    CGContextAddArc(context, 160, 160, 100.0, 0.0, M_PI/2, 0);
    
    //设置属性
    [[UIColor orangeColor] set];
    
    //绘制
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end

//
//  SecondViewController.m
//  贝塞尔曲线Demo
//
//  Created by 周浩 on 16/6/23.
//  Copyright © 2016年 周浩. All rights reserved.
//

#import "SecondViewController.h"
/**
 *  颜色
 */
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGBColor(r,g,b) RGBAColor(r,g,b,1.0f)

@interface SecondViewController (){
    CGPoint centers;
    CAShapeLayer *progressLayer;
    float _speed;
    UILabel *speedLabel;
    UISlider *slide;
}
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorFromRGB(0x1F97D5);
    centers = self.view.center;
    switch (self.bezierStyle) {
        case 0:
            [self test1];
            break;
        case 1:
            [self test2];
            break;
        case 2:
            [self test3];
            break;
        case 3:
            [self test4];
            break;
        case 4:
            [self test5];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test1{
    //主要解释一下各个参数的意思
    //center  中心点（可以理解为圆心）
    //radius  半径
    //startAngle 起始角度
    //endAngle  结束角度
    //clockwise  是否顺时针
    UIBezierPath *cicrle     = [UIBezierPath bezierPathWithArcCenter:centers
                                                              radius:95
                                                          startAngle:- M_PI
                                                            endAngle: 0
                                                           clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth     = 5.f;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor   = RGBColor(185,243,110).CGColor;
    shapeLayer.path          = cicrle.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
}

- (void)test2{

    UIBezierPath *cicrle     = [UIBezierPath bezierPathWithArcCenter:centers
                                                              radius:95
                                                          startAngle:- M_PI
                                                            endAngle: 0
                                                           clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth     = 5.f;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor   = RGBColor(185,243,110).CGColor;
    shapeLayer.path          = cicrle.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    
    CGFloat perAngle = M_PI / 50;
    CGFloat startAngel;
    CGFloat endAngel;
    //我们需要计算出每段弧线的起始角度和结束角度
    //这里我们从- M_PI 开始，我们需要理解与明白的是我们画的弧线与内侧弧线是同一个圆心
    for (int i = 0; i< 51; i++) {
        
        startAngel = (-M_PI + perAngle * i);
        //  perAngle/5 为刻度线的宽度
        endAngel   = startAngel + perAngle/5;
        
        UIBezierPath *tickPath = [UIBezierPath bezierPathWithArcCenter:centers radius:150 startAngle:startAngel endAngle:endAngel clockwise:YES];
        CAShapeLayer *perLayer = [CAShapeLayer layer];
        
        if (i % 5 == 0) {
            
            perLayer.strokeColor = [UIColor colorWithRed:0.62 green:0.84 blue:0.93 alpha:1.0].CGColor;
            perLayer.lineWidth   = 10.f;
            
        }else{
            
            perLayer.strokeColor = [UIColor colorWithRed:0.22 green:0.66 blue:0.87 alpha:1.0].CGColor;
            perLayer.lineWidth   = 5;
            
        }
        
        perLayer.path = tickPath.CGPath;
        
        [self.view.layer addSublayer:perLayer];
    }
}
- (void)test3{
    
    UIBezierPath *cicrle     = [UIBezierPath bezierPathWithArcCenter:centers
                                                              radius:95
                                                          startAngle:- M_PI
                                                            endAngle: 0
                                                           clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth     = 5.f;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor   = RGBColor(185,243,110).CGColor;
    shapeLayer.path          = cicrle.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];

    CGFloat perAngle = M_PI / 50;
    CGFloat startAngel;
    CGFloat endAngel;
    CGFloat textAngel;
    //我们需要计算出每段弧线的起始角度和结束角度
    //这里我们从- M_PI 开始，我们需要理解与明白的是我们画的弧线与内侧弧线是同一个圆心
    for (int i = 0; i< 51; i++) {
        
        startAngel = (-M_PI + perAngle * i);
        endAngel   = startAngel + perAngle/5;
        
        UIBezierPath *tickPath = [UIBezierPath bezierPathWithArcCenter:centers radius:150 startAngle:startAngel endAngle:endAngel clockwise:YES];
        CAShapeLayer *perLayer = [CAShapeLayer layer];
        
        if (i % 5 == 0) {
            
            perLayer.strokeColor = [UIColor colorWithRed:0.62 green:0.84 blue:0.93 alpha:1.0].CGColor;
            perLayer.lineWidth   = 10.f;
            textAngel = endAngel;
            //添加刻度
            CGPoint point      = [self calculateTextPositonWithArcCenter:centers Angle:textAngel];
            NSString *tickText = [NSString stringWithFormat:@"%d",i * 2];
            
            //默认label的大小14 * 14
            UILabel *text      = [[UILabel alloc] initWithFrame:CGRectMake(point.x - 5, point.y - 5, 14, 14)];
            text.text          = tickText;
            text.font          = [UIFont systemFontOfSize:6];
            text.textColor     = [UIColor colorWithRed:0.54 green:0.78 blue:0.91 alpha:1.0];
            text.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:text];
            
        }else{
            perLayer.strokeColor = [UIColor colorWithRed:0.22 green:0.66 blue:0.87 alpha:1.0].CGColor;
            perLayer.lineWidth   = 5;
        }
        perLayer.path = tickPath.CGPath;
        [self.view.layer addSublayer:perLayer];
    }
}

- (void)test4{
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil];
    [@"km/h" drawInRect:CGRectMake(centers.x - 15, centers.y, 60, 20) withAttributes:attributes];
}

- (void)test5{
    [self test3];
    // 进度的曲线
    UIBezierPath *progressPath  = [UIBezierPath bezierPathWithArcCenter:centers
                                                                 radius:120
                                                             startAngle:- M_PI
                                                               endAngle:0
                                                              clockwise:YES];
 
    progressLayer = [CAShapeLayer layer];
    progressLayer.lineWidth     =  50.f;
    progressLayer.fillColor     = [UIColor clearColor].CGColor;
    progressLayer.strokeColor   =  RGBAColor(185,243,110,0.2).CGColor;
    progressLayer.path          = progressPath.CGPath;
    progressLayer.strokeStart   = 0;
    progressLayer.strokeEnd     = 0;
    [self.view.layer addSublayer:progressLayer];
    
    speedLabel = [[UILabel alloc] initWithFrame:CGRectMake(centers.x - 10, centers.y -20, 50, 20)];
    speedLabel.textColor = [UIColor blackColor];
    [self.view addSubview:speedLabel];
    slide = [[UISlider alloc] initWithFrame:CGRectMake(centers.x - 100,centers.y +50, 200, 2)];
    [self.view addSubview:slide];
    [slide addTarget:self action:@selector(setSpeed) forControlEvents:UIControlEventValueChanged];
}

//提供一个外部的接口，通过重写setter方法来改变进度
- (void)setSpeed
{
    _speed = slide.value;
    progressLayer.strokeEnd = _speed? _speed:0;
    [UIView animateWithDuration:0.1 animations:^{
        speedLabel.text = [NSString stringWithFormat:@"%.f",_speed*100];
    }];
}

//默认计算半径135
- (CGPoint)calculateTextPositonWithArcCenter:(CGPoint)center
                                       Angle:(CGFloat)angel
{
    CGFloat x = 135 * cosf(angel);
    CGFloat y = 135 * sinf(angel);
    
    return CGPointMake(center.x + x, center.y + y);
}
@end

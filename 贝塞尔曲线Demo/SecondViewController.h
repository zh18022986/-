//
//  SecondViewController.h
//  贝塞尔曲线Demo
//
//  Created by 周浩 on 16/6/23.
//  Copyright © 2016年 周浩. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BezierStyle) {
    BezierStyleOne,
    BezierStyleTwo,
    BezierStyleThree,
    BezierStyleFour,
    BezierStyleFive,
};

@interface SecondViewController : UIViewController

/** <#注释#> */
@property (nonatomic, assign) BezierStyle bezierStyle;

@end

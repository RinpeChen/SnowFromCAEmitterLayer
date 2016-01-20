//
//  ViewController.m
//  使用CAEmitterLayer实现下雪效果
//
//  Created by RinpeChen on 16/1/20.
//  Copyright © 2016年 Rinpe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 创建发射器图层
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    // 发射点
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);
    // 范围
    snowEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width, 0.0);
    
    snowEmitter.emitterMode		= kCAEmitterLayerOutline;   // 发射模式
    snowEmitter.emitterShape	= kCAEmitterLayerLine;      // 发射形状
    
    // 创建被发射的东西(雪花)
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    
    snowflake.birthRate		= 1.5;              // 雪花的产生量
    snowflake.lifetime		= 120.0;            // 雪花的生命周期(秒)
    
    snowflake.velocity		= -10;				// 雪花的速度
    snowflake.velocityRange = 10;               // 速度的范围加减10
    snowflake.yAcceleration = 2;                // 重力
    snowflake.emissionRange = 0.5 * M_PI;		// 雪花发射角度范围
    snowflake.spinRange		= 0.25 * M_PI;		// 雪花自旋角度范围
    
    snowflake.contents		= (id) [[UIImage imageNamed:@"snow"] CGImage];  // 图片
    snowflake.color         = [UIColor whiteColor].CGColor;     // 雪花的颜色
    
    // 下面参数设置使得雪花看起来像是在背景里(设置阴影之类的)
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor   = [[UIColor lightGrayColor] CGColor];
    
    // 将要发射的内容添加到发射器图层上
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}

@end

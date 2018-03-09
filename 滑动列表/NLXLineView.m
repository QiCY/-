//
//  NLXLineView.m
//  滑动列表
//
//  Created by admin on 2018/2/9.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "NLXLineView.h"

@implementation NLXLineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        [self createXlayer:frame];
        [self setXlayerPoint:nil];
        [self setXlayerText:nil];
        
        [self createYLayer:frame];
        [self setYlayerPoint:nil];
        [self setYlayerText:nil];
        
    }
    return self;
}
-(void)createXlayer:(CGRect)frame{
    CGFloat widht = frame.size.width;
    CGFloat height = frame.size.height;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.backgroundColor = [[UIColor blackColor] CGColor];
    layer.frame = CGRectMake(10, height-10, widht - 20, 1);
    [self.layer addSublayer:layer];
    self.xlayer = layer;
}
- (void)setXlayerPoint:(NSMutableArray *)dataList
{
    CGFloat width = (self.frame.size.width - 20)/6;
    for (int i = 0; i<6; i++) {
        if (i != 0) {
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.frame = CGRectMake(i*width, -2, 2, 2);
            layer.backgroundColor = [UIColor blackColor].CGColor;
            [self.xlayer addSublayer:layer];
        }
    }
}
- (void)setXlayerText:(NSMutableArray *)dataList
{
     CGFloat width = (self.frame.size.width - 20)/6;
    for (int i = 0; i<6; i++) {
        CATextLayer *layer = [CATextLayer layer];
        layer.frame = CGRectMake(i*width - 5, 5, 30, 20);
        layer.string = @"1";
        layer.fontSize = 10;
        layer.foregroundColor = [UIColor grayColor].CGColor;
        [self.xlayer addSublayer:layer];
        
    }
}

- (void)createYLayer:(CGRect)frame
{
//    CGFloat widht = frame.size.width;
    CGFloat height = frame.size.height;
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.backgroundColor = [[UIColor redColor] CGColor];
    layer.frame = CGRectMake(10, 0, 1, height - 10);
    [self.layer addSublayer:layer];
    self.yLayer = layer;
}

- (void)setYlayerPoint:(NSMutableArray *)dataList
{
    CGFloat width = (self.frame.size.height - 10)/6;
    for (int i = 0; i<6; i++) {
        if (i != 0) {
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.frame = CGRectMake(0, i*width, 2, 2);
            layer.backgroundColor = [UIColor blackColor].CGColor;
            [self.yLayer addSublayer:layer];
        }
    }
}

- (void)setYlayerText:(NSMutableArray *)dataList
{
    CGFloat width = (self.frame.size.height - 20)/6;
    for (int i = 0; i<6; i++) {
        if (i !=0) {
            CATextLayer *layer = [CATextLayer layer];
            layer.frame = CGRectMake(-20,  i*width, 20, 20);
            layer.string = @"2";
            layer.fontSize = 10;
            layer.foregroundColor = [UIColor grayColor].CGColor;
            [self.yLayer addSublayer:layer];
        }
       
        
    }
}
@end

//
//  CartoonView.m
//  02 Cartoon
//
//  Created by wang xinkai on 15/8/28.
//  Copyright (c) 2015年 wxk. All rights reserved.
//

#import "CartoonView.h"


//18 139 230
#define kDoraBlue     [UIColor colorWithRed:29.0f/255.f green:159.f/255.f blue:230.f/255.f alpha:1]

@implementation CartoonView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
 
    [self drawDoraemon:UIGraphicsGetCurrentContext()];
    
}

//绘制 哆啦A梦
-(void)drawDoraemon:(CGContextRef)context{

// 1.   外部轮廓
    CGContextSetLineWidth(context, 3);

    //1.1    外部圆
        //1.1.1        填充色
        //保存当前状态（CGContextSaveGState）
        //保存画笔的状态。比如宽度，颜色，交叉点类型，端点类型等等
        //保存到恢复之间的设置 将不会对后面的代码产生影响 （CGContextRestoreGState）
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, kDoraBlue.CGColor);
    CGContextAddArc(context, self.width/2, self.width/2, self.width/2-50, M_PI_4+M_PI_4*.2, -M_PI_4-M_PI, 1);
    //密封路径
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    
        // 1.1.2       线条
    CGContextAddArc(context, self.width/2, self.width/2, self.width/2-50, M_PI_4+M_PI_4*.2, -M_PI_4-M_PI, 1);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    
    
    //1.2下方黑线
    CGContextSetLineWidth(context, 20);
    CGContextMoveToPoint(context, 282, 298);
    CGContextAddLineToPoint(context, 85, 283.5);
    CGContextSetLineCap(context,kCGLineCapRound);
    CGContextStrokePath(context);
    
    
    //1.3下方红线
    CGContextSetLineWidth(context, 14);
    CGContextMoveToPoint(context, 282, 298);
    CGContextAddLineToPoint(context, 85, 283.5);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextSetLineCap(context,kCGLineCapRound);
    CGContextStrokePath(context);
    //恢复状态
    CGContextRestoreGState(context);

    
    
    
    
//2.    内部轮廓
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);

    CGContextMoveToPoint(context, 83.5, 272.5);
    CGContextAddCurveToPoint(context, 30.5-100, 44, 335.5+100, 68, 260.5, 285.5);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextMoveToPoint(context, 83.5, 272.5);
    CGContextAddCurveToPoint(context, 30.5-100, 44, 335.5+100, 68, 260.5, 285.5);
    CGContextClosePath(context);
    CGContextStrokePath(context);

    
    
//3.   眼睛
    CGContextSaveGState(context);

    
    //3.1 左眼
    
    //眼睛看做稍微的倾斜的椭圆
    //放射变换 （1.旋转是以(0,0)点为圆心旋转，正数为顺时针   2.translate位移  3.scale 负数代表翻转）
    //倾斜
    CGContextRotateCTM(context, M_PI/8);
    CGContextTranslateCTM(context, 40, -80);
    
    //线条
    CGContextStrokeEllipseInRect(context, CGRectMake(107, 66.5, 55+10, 144-65.5+10));
    //填充色
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(107+2, 66.5+2, 55+10-3, 144-65.5+10-3));
    
    //3.2 右眼

    CGContextStrokeEllipseInRect(context, CGRectMake(107+65, 66.5-10, 55+10, 144-65.5));
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(107+65+2, 66.5-10+2, 55+10-3, 144-65.5-3));
    
    CGContextRestoreGState(context);

    
    //3.3 眼睛里的两条弧线
    CGContextSaveGState(context);
    
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context,kCGLineCapRound);
    
    CGContextAddArc(context, 149.5, 86, 30, M_PI_4, M_PI_2, 0);
    CGContextStrokePath(context);

    CGContextAddArc(context, 219, 90, 30, M_PI_2, M_PI_2+M_PI_4, 0);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);


// 4. 鼻子
    
    CGContextAddArc(context, 165, 145, 25, 0, 2*M_PI, 0);
    CGContextStrokePath(context);
    
    CGContextAddArc(context, 165, 145, 24, 0, 2*M_PI, 0);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextAddArc(context, 165-10, 145-10, 8, 0, 2*M_PI, 0);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    
// 5.   嘴巴
    CGContextSetLineJoin(context, kCGLineJoinRound);

    
    CGContextMoveToPoint(context, 159, 170.5);
    CGContextAddQuadCurveToPoint(context, 152.5, 186.5, 154.5, 208);

    CGContextAddCurveToPoint(context, 127.5, 174, 101, 221.5, 148, 230.5);
    
    CGContextAddCurveToPoint(context, 117, 230.5, 127, 256, 150.5, 246.5);
    CGContextStrokePath(context);

    
// 6. 胡须
    
    CGContextMoveToPoint(context, 124.5, 164.5);
    CGContextAddQuadCurveToPoint(context, 98.5, 155.5, 76, 151.5);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 114, 186);
    CGContextAddQuadCurveToPoint(context, 87, 179.5, 63, 182);
    CGContextStrokePath(context);
    
    CGContextMoveToPoint(context, 110.5, 200.5);
    CGContextAddQuadCurveToPoint(context, 84, 203, 66, 214);
    CGContextStrokePath(context);
    
    
    CGContextMoveToPoint(context, 198.5, 168);
    CGContextAddQuadCurveToPoint(context, 243, 158.5, 275, 157);
    CGContextStrokePath(context);
    
    
    CGContextMoveToPoint(context, 196.5, 186.5);
    CGContextAddQuadCurveToPoint(context, 248.5, 187, 282, 196.5);
    CGContextStrokePath(context);
    
    
    CGContextMoveToPoint(context, 196, 205);
    CGContextAddQuadCurveToPoint(context, 236, 207.5, 265.5, 222.5);
    CGContextStrokePath(context);
    

    
    
    
    

}



//获取当前view的宽
-(CGFloat)width{
    return self.frame.size.width;
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    NSLog(@"%@",NSStringFromCGPoint([[touches anyObject] locationInView:self]));
    
}







@end

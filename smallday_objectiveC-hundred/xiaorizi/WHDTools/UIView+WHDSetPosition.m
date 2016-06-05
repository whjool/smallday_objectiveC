//
//  UIView+WHDSetPosition.m
//  xiaorizi
//
//  Created by HUN on 16/6/4.
//  Copyright © 2016年 hundred Company. All rights reserved.
//

#import "UIView+WHDSetPosition.h"

@implementation UIView (WHDSetPosition)

-(void)setX:(CGFloat)x
{
    CGRect tmp=self.frame;
    tmp.origin.x=x;
    self.frame=tmp;
}

-(void)setY:(CGFloat)y
{
    CGRect tmp=self.frame;
    tmp.origin.y=y;
    self.frame=tmp;
}
-(void)setMyWidth:(CGFloat)myWidth
{
    CGRect tmp=self.frame;
    tmp.size.width=myWidth;
    self.frame=tmp;
}

-(void)setMyHeight:(CGFloat)myHeight
{
    CGRect tmp=self.frame;
    tmp.size.height=myHeight;
    self.frame=tmp;
}


-(void)setMyPoint:(CGPoint)myPoint
{
    CGRect tmp=self.frame;
    tmp.origin=myPoint;
    self.frame=tmp;
}

-(void)setMySize:(CGSize)mySize
{
    CGRect tmp=self.frame;
    tmp.size=mySize;
    self.frame=tmp;
}

-(void)setMyRect:(CGRect)myRect
{
    CGRect tmp=self.frame;
    tmp=myRect;
    self.frame=tmp;
}

@end

//
//  Quiz8DrawingView.m
//  Quiz8
//
//  Created by Moser, Wesley on 4/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "Quiz8DrawingView.h"

@interface Quiz8DrawingView ()
@property (strong, nonatomic) NSMutableArray *points;

@end

@implementation Quiz8DrawingView

CGPoint currentPoint;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    [bz setLineWidth:3.0];
    [[UIColor blackColor] setStroke];
    
    [bz moveToPoint:[[self.points firstObject] CGPointValue]];
    
    for (id p in self.points)
    {
        [bz addLineToPoint:[p CGPointValue]];
    }
    
    CGPoint lastPoint = [[self.points lastObject] CGPointValue];
    currentPoint = CGPointMake(lastPoint.x + self.currentHorizontalAngle * 10.0,
                               lastPoint.y + self.currentVerticalAngle * 10.0);
    
    if (currentPoint.x < 0)
        currentPoint.x = 0;
    if (currentPoint.y < 0)
        currentPoint.y = 0;
    if (currentPoint.x > self.bounds.size.width)
        currentPoint.x = self.bounds.size.width;
    if (currentPoint.y > self.bounds.size.height)
        currentPoint.y = self.bounds.size.height;
    
    [bz addLineToPoint:currentPoint];
    [self saveCurrentPoint];
    [bz stroke];
    [self drawCurrentPoint];
}

- (void)drawCurrentPoint
{
    [[UIColor whiteColor] setStroke];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:currentPoint];
    [path setLineWidth:4];
    CGPoint p = CGPointMake(currentPoint.x - 2, currentPoint.y - 2);
    [path addLineToPoint:p];
    p.x += 4.0;
    [path addLineToPoint:p];
    p.y += 4.0;
    [path addLineToPoint:p];
    p.x -= 4.0;
    [path addLineToPoint:p];
    [path stroke];
}

- (void)saveCurrentPoint
{
    self.currentVerticalAngle = 0;
    self.currentHorizontalAngle = 0;
    self.currentVelocity = 0;
    
    if (self.points == nil)
        self.points = [[NSMutableArray alloc] init];
    [self.points addObject:[NSValue valueWithCGPoint:currentPoint]];
}

@end

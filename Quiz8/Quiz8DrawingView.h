//
//  Quiz8DrawingView.h
//  Quiz8
//
//  Created by Moser, Wesley on 4/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Quiz8DrawingView : UIView

//@property (nonatomic) CGPoint currentPoint;

@property (nonatomic) float currentHorizontalAngle;
@property (nonatomic) float currentVerticalAngle;
@property (nonatomic) float currentVelocity;

- (void)saveCurrentPoint;

@end

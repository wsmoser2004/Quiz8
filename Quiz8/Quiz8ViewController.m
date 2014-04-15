//
//  Quiz8ViewController.m
//  Quiz8
//
//  Created by Moser, Wesley on 4/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "Quiz8ViewController.h"

@interface Quiz8ViewController ()
@property (nonatomic) float lastVelocity;
@end

@implementation Quiz8ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self.horizontalView addGestureRecognizer:self.horizontalGestureRecognizer];
    [self.verticalView addGestureRecognizer:self.verticalGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addHorizontal:(id)sender
{
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians horizontal", s.rotation);
    
    if (self.lastVelocity > 0 && s.velocity < 0)
        [self.drawingView saveCurrentPoint];
    if (self.lastVelocity < 0 && s.velocity > 0)
        [self.drawingView saveCurrentPoint];
    self.drawingView.currentVelocity = s.velocity;
    self.drawingView.currentHorizontalAngle = s.rotation;
    if (s.state == UIGestureRecognizerStateEnded)
        [self.drawingView saveCurrentPoint];
    self.lastVelocity = s.velocity;
    
    [[self drawingView] setNeedsDisplay];
}

- (IBAction)addVertical:(id)sender
{
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians vertical", s.rotation);
    
    if (self.lastVelocity > 0 && s.velocity < 0)
        [self.drawingView saveCurrentPoint];
    if (self.lastVelocity < 0 && s.velocity > 0)
        [self.drawingView saveCurrentPoint];
    self.drawingView.currentVelocity = s.velocity;
    self.drawingView.currentVerticalAngle = s.rotation;
    if (s.state == UIGestureRecognizerStateEnded)
        [self.drawingView saveCurrentPoint];
    self.lastVelocity = s.velocity;
    
    [[self drawingView] setNeedsDisplay];
}
@end

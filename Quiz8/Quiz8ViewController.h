//
//  Quiz8ViewController.h
//  Quiz8
//
//  Created by Moser, Wesley on 4/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz8DrawingView.h"

@interface Quiz8ViewController : UIViewController

@property (weak, nonatomic) IBOutlet Quiz8DrawingView *drawingView;
@property (weak, nonatomic) IBOutlet UIView *horizontalView;
@property (weak, nonatomic) IBOutlet UIView *verticalView;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *horizontalGestureRecognizer;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *verticalGestureRecognizer;

- (IBAction)addHorizontal:(id)sender;
- (IBAction)addVertical:(id)sender;

@end

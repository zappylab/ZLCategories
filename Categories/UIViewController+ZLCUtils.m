//
// Created by Ilya Dyakonov on 04/09/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//
//


#import "UIViewController+ZLCUtils.h"
#import "UIView+ZLCConstraintsSetup.h"

/////////////////////////////////////////////////////

@implementation UIViewController (ZLCUtils)

-(void) zlc_showChildViewController:(UIViewController *) childController
                        inContainer:(UIView *) container
{
    [childController willMoveToParentViewController:self];
    [container addSubview:childController.view];
    [self addChildViewController:childController];
    [childController didMoveToParentViewController:self];
    childController.view.translatesAutoresizingMaskIntoConstraints = NO;
    [container ZLC_bindSubviewHorizontally:childController.view];
    [container ZLC_bindSubviewVertically:childController.view];
}

-(void) zlc_removeChildViewController
{
    UIViewController *childViewController = [self.childViewControllers firstObject];
    [childViewController.view removeFromSuperview];
    [childViewController removeFromParentViewController];
}

@end

/////////////////////////////////////////////////////
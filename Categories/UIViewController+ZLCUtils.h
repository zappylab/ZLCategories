//
// Created by Ilya Dyakonov on 04/09/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//
//


#import <Foundation/Foundation.h>

/////////////////////////////////////////////////////

@interface UIViewController (ZLCUtils)

-(void) zlc_showChildViewController:(UIViewController *) childController
                        inContainer:(UIView *) container;
-(void) zlc_removeChildViewController;

@end

/////////////////////////////////////////////////////

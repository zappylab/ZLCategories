//
// Created by Ilya Dyakonov on 27/05/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//

#import <Foundation/Foundation.h>

/////////////////////////////////////////////////////

@interface UIView (ZLCConstraintsSetup)

-(void) zlc_bindSubviewVertically:(UIView *) subview;
-(void) zlc_bindSubviewHorizontally:(UIView *) subview;

-(void) zlc_bindSubviewVertically:(UIView *) superView
                  upperEdgeIndent:(NSInteger) upperEdgeIndent
                 bottomEdgeIndent:(NSInteger) bottomEdgeIndent;

-(void) zlc_centerSubview:(UIView *) subview;

-(NSLayoutConstraint *) zlc_bindWidth:(CGFloat) width;
-(NSLayoutConstraint *) zlc_bindHeight:(CGFloat) height;
-(NSLayoutConstraint *) zlc_constraintForEqualWidthsWithView:(UIView *) view;

-(NSLayoutConstraint *) zlc_constraintAligningLeftEdgeWithRightEdgeOfView:(UIView *) view;
-(NSLayoutConstraint *) zlc_constraintAligningLeftEdgesWithView:(UIView *) view;

@end

/////////////////////////////////////////////////////

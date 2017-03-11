//
// Created by Ilya Dyakonov on 27/05/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//

#import <Foundation/Foundation.h>

/////////////////////////////////////////////////////

@interface UIView (ZLCConstraintsSetup)

-(void) ZLC_bindSubviewVertically:(UIView *) subview;
-(void) ZLC_bindSubviewHorizontally:(UIView *) subview;

-(void) zlc_bindSubviewVertically:(UIView *) superView
                  upperEdgeIndent:(NSInteger) upperEdgeIndent
                 bottomEdgeIndent:(NSInteger) bottomEdgeIndent;

-(void) zlc_centerSubview:(UIView *) subview;

-(NSLayoutConstraint *) ZLC_bindWidth:(CGFloat) width;
-(NSLayoutConstraint *) ZLC_constraintForEqualWidthsWithView:(UIView *) view;

-(NSLayoutConstraint *) ZLC_constraintAligningLeftEdgeWithRightEdgeOfView:(UIView *) view;
-(NSLayoutConstraint *) ZLC_constraintAligningLeftEdgesWithView:(UIView *) view;

@end

/////////////////////////////////////////////////////

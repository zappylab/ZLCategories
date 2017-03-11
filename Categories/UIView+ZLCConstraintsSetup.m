//
// Created by Ilya Dyakonov on 27/05/14.
// Copyright (c) 2014 ZappyLab. All rights reserved.
//
//


#import "UIView+ZLCConstraintsSetup.h"

/////////////////////////////////////////////////////

@implementation UIView (ZLCConstraintsSetup)

-(void) ZLC_bindSubviewVertically:(UIView *) subview
{
    [self ZLC_bindSubview:subview
                  byAxis:@"V"];
}

-(void) ZLC_bindSubviewHorizontally:(UIView *) subview
{
    [self ZLC_bindSubview:subview
                  byAxis:@"H"];
}

-(void) zlc_bindSubviewVertically:(UIView *) superView
                  upperEdgeIndent:(NSInteger) upperEdgeIndent
                 bottomEdgeIndent:(NSInteger) bottomEdgeIndent
{
    NSLayoutConstraint *bottomPositionConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                                attribute:NSLayoutAttributeBottom
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:superView
                                                                                attribute:NSLayoutAttributeBottom
                                                                               multiplier:1
                                                                                 constant:bottomEdgeIndent];
    [superView addConstraint:bottomPositionConstraint];
    NSLayoutConstraint *topPositionConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                             attribute:NSLayoutAttributeTop
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:superView
                                                                             attribute:NSLayoutAttributeTop
                                                                            multiplier:1
                                                                              constant:upperEdgeIndent];
    [superView addConstraint:topPositionConstraint];
}

//
// axis : H or V
//
-(void) ZLC_bindSubview:(UIView *) subview
                byAxis:(NSString *) axis
{
    NSAssert([self.subviews containsObject:subview], @"should be a subview to be bounded");

    static NSString *const subviewKey = @"subview";

    NSString *verticalConstraintsFormat = [NSString stringWithFormat:@"%@:|[%@]|",
                                                                     axis,
                                                                     subviewKey];
    NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:verticalConstraintsFormat
                                                                           options:kNilOptions
                                                                           metrics:nil
                                                                             views:@{subviewKey : subview}];
    [self addConstraints:verticalConstraints];
}

-(NSLayoutConstraint *) ZLC_bindWidth:(CGFloat) width
{
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1
                                                                        constant:width];
    [self addConstraint:widthConstraint];
    return widthConstraint;
}

-(NSLayoutConstraint *) ZLC_constraintForEqualWidthsWithView:(UIView *) view
{
    NSLayoutConstraint *equalWidthsConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:view
                                                                             attribute:NSLayoutAttributeWidth
                                                                            multiplier:1
                                                                              constant:0];
    return equalWidthsConstraint;
}

-(NSLayoutConstraint *) ZLC_constraintAligningLeftEdgeWithRightEdgeOfView:(UIView *) view
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1
                                                                   constant:0];
    return constraint;
}

-(NSLayoutConstraint *) ZLC_constraintAligningLeftEdgesWithView:(UIView *) view
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:view
                                                                  attribute:NSLayoutAttributeLeft
                                                                 multiplier:1
                                                                   constant:0];
    return constraint;
}

-(void) ZLC_centerSubview:(UIView *) subview
{
    NSLayoutConstraint *horizontalCenterAlignment = [NSLayoutConstraint constraintWithItem:subview
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                multiplier:1
                                                                                  constant:0];
    NSLayoutConstraint *verticalCenterAlignment = [NSLayoutConstraint constraintWithItem:subview
                                                                               attribute:NSLayoutAttributeCenterY
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self
                                                                               attribute:NSLayoutAttributeCenterY
                                                                              multiplier:1
                                                                                constant:0];
    [self addConstraints:@[horizontalCenterAlignment, verticalCenterAlignment]];
}

@end

/////////////////////////////////////////////////////

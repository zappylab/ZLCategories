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

-(NSLayoutConstraint *) ZLC_constraintAlingningLeftEdgesWithView:(UIView *) view
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

@end

/////////////////////////////////////////////////////
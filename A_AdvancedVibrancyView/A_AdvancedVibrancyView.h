//
//  A_AdvancedVibrancyView.h
//  A_VibrancyView_Demo
//
//  Created by Animax Deng on 2/22/16.
//  Copyright © 2016 Animax Deng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface A_AdvancedVibrancyView : UIView

// Blur radius value region [0.0 - 30.0]
@property (nonatomic) IBInspectable float blurRadius;
@property (nonatomic, retain) IBInspectable UIColor *colorTint;

// Grayscale tint alpha value region [0.0 - 1.0]
@property (nonatomic) IBInspectable float grayscaleTintAlpha;

// Grayscale tint leavel value region [0.0 - 1.0]: 0.0 means black, 1.0 means white
@property (nonatomic) IBInspectable float grayscaleTintLevel;

- (void)presentEffect;
- (void)presentEffect: (UIBlurEffectStyle)style;
- (void)presentEffectWithoutAnimation: (UIBlurEffectStyle)style;
- (void)presentEffect: (UIBlurEffectStyle)style animationDuration:(double)duration;

- (void)convertAllSubview;

@end

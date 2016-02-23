//
//  A_AdvancedVibrancyView.m
//  A_VibrancyView_Demo
//
//  Created by Animax Deng on 2/22/16.
//  Copyright © 2016 Animax Deng. All rights reserved.
//

#import "A_AdvancedVibrancyView.h"

@interface UIBlurEffect()
- (id)effectSettings;
@end

@interface _customBlurEffect : UIBlurEffect

@property (nonatomic) NSInteger blurRadius;

@end

@implementation _customBlurEffect

- (id)effectSettings {
    id setting = [super effectSettings];
    if (self.blurRadius > 0) {
        [setting setValue:@(self.blurRadius) forKey:@"blurRadius"];
    }
    return setting;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    _customBlurEffect *effect = [super copyWithZone:zone];
    effect.blurRadius = self.blurRadius;
    return effect;
}

@end


@implementation A_AdvancedVibrancyView {
    @private
    _customBlurEffect       *_blurEffect;
    UIVisualEffectView      *_effectView;
    UIVisualEffectView      *_vibrancyView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    [self presentEffectView];
}

#pragma mark - Public actions
- (void)presentEffectView {
    [self presentEffectView:UIBlurEffectStyleLight];
}
- (void)presentEffectView: (UIBlurEffectStyle)style {
    _blurEffect = (_customBlurEffect*)[_customBlurEffect effectWithStyle:style];
//    _blurEffect = [[_customBlurEffect alloc] init];
    _effectView = [[UIVisualEffectView alloc] initWithEffect:_blurEffect];
    
    [self insertSubview:_effectView atIndex:0];
    [self autoFullesize:_effectView];
    
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:_blurEffect];
    _vibrancyView = [[UIVisualEffectView alloc] initWithEffect:vibrancy];
    [_effectView.contentView addSubview:_vibrancyView];
    [self autoFullesize:_vibrancyView];
    
    [self layoutIfNeeded];
}

- (void)convertAllSubview {
    if (_vibrancyView) {
        for (UIView *item in self.subviews) {
            if (item != _effectView && item != _vibrancyView) {
                [_vibrancyView.contentView addSubview:item];
            }
        }
    }
}

#pragma mark - Helping methods
- (void)autoFullesize: (UIView *)subview {
    subview.translatesAutoresizingMaskIntoConstraints = false;
    [subview.superview addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.f]];
    [subview.superview addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.f]];
    [subview.superview addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.f]];
    [subview.superview addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subview.superview attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.f]];
}

#pragma mark - Vibrancy properties
@synthesize blurRadius;

- (NSInteger)blurRadius {
    if (_blurEffect) {
        return _blurEffect.blurRadius;
    } else {
        return -1;
    }
}
- (void)setBlurRadius:(NSInteger)newValue {
    if (_blurEffect) {
        [_blurEffect setBlurRadius:newValue];
        [_effectView setEffect:_blurEffect];
    }
}

@end



////
//@property (nonatomic) BOOL appliesTintAndBlurSettings;
//@property (nonatomic) _UIBackdropView *backdrop;
//@property (getter=isBackdropVisible, nonatomic) BOOL backdropVisible;
//@property (nonatomic) int blurHardEdges;
//@property (nonatomic, copy) NSString *blurQuality;
//@property (nonatomic) float blurRadius;
//@property (nonatomic) BOOL blursWithHardEdges;
//@property (nonatomic) float colorBurnTintAlpha;
//@property (nonatomic) float colorBurnTintLevel;
//@property (nonatomic, retain) UIImage *colorBurnTintMaskImage;
//@property (nonatomic) float colorOffsetAlpha;
//@property (nonatomic, retain) NSValue *colorOffsetMatrix;
//@property (nonatomic, retain) _UIBackdropColorSettings *colorSettings;
//@property (nonatomic, retain) UIColor *colorTint;
//@property (nonatomic) float colorTintAlpha;
//@property (nonatomic) float colorTintMaskAlpha;
//@property (nonatomic, retain) UIImage *colorTintMaskImage;
//@property (nonatomic, readonly) UIColor *combinedTintColor;
//@property (nonatomic) BOOL darkenWithSourceOver;
//@property (nonatomic) float darkeningTintAlpha;
//@property (nonatomic) float darkeningTintBrightness;
//@property (nonatomic) float darkeningTintHue;
//@property (nonatomic, retain) UIImage *darkeningTintMaskImage;
//@property (nonatomic) float darkeningTintSaturation;
//@property (setter=setDesignMode:, nonatomic) BOOL designMode;
//@property (getter=isEnabled, nonatomic) BOOL enabled;
//@property (nonatomic) BOOL explicitlySetGraphicsQuality;
//@property (nonatomic) float filterMaskAlpha;
//@property (nonatomic, retain) UIImage *filterMaskImage;
//@property (nonatomic) int graphicsQuality;
//@property (nonatomic) float grayscaleTintAlpha;
//@property (nonatomic) float grayscaleTintLevel;
//@property (nonatomic) float grayscaleTintMaskAlpha;
//@property (nonatomic, retain) UIImage *grayscaleTintMaskImage;
//@property (getter=isHighlighted, nonatomic) BOOL highlighted;
//@property (nonatomic, retain) UIColor *legibleColor;
//@property (nonatomic) BOOL lightenGrayscaleWithSourceOver;
//@property (nonatomic) int renderingHint;
//@property (nonatomic) BOOL requiresColorStatistics;
//@property (nonatomic) float saturationDeltaFactor;
//@property (nonatomic) float scale;
//@property (getter=isSelected, nonatomic) BOOL selected;
//@property (nonatomic) int stackingLevel;
//@property (nonatomic) double statisticsInterval;
//@property (nonatomic, readonly) int style;
//@property (nonatomic) int suppressSettingsDidChange;
//@property (nonatomic) BOOL usesBackdropEffectView;
//@property (nonatomic) BOOL usesColorBurnTintView;
//@property (nonatomic) BOOL usesColorOffset;
//@property (nonatomic) BOOL usesColorTintView;
//@property (nonatomic) BOOL usesContentView;
//@property (nonatomic) BOOL usesDarkeningTintView;
//@property (nonatomic) BOOL usesGrayscaleTintView;
//@property (nonatomic) unsigned int version;
//@property (nonatomic) float zoom;
//@property (nonatomic) BOOL zoomsBack;

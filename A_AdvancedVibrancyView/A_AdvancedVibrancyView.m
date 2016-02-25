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

@property (nonatomic) float blurRadius;
@property (nonatomic) int blurHardEdges;
@property (nonatomic, retain) UIColor *colorTint;
@property (nonatomic) float grayscaleTintAlpha;
@property (nonatomic) float grayscaleTintLevel;

@end

@implementation _customBlurEffect

- (instancetype)init {
    self = [super init];
    if (self) {
        _grayscaleTintAlpha = -1;
        _grayscaleTintLevel = -1;
        _blurRadius = -1;
    }
    return self;
}

- (id)effectSettings {
    id setting = [super effectSettings];
    if (self.blurRadius > 0.1f) {
        [setting setValue:@(self.blurRadius) forKey:@"blurRadius"];
    }
    if (self.colorTint) {
        [setting setValue:self.colorTint forKey:@"colorTint"];
        [setting setValue:@(true) forKey:@"usesColorTintView"];
        [setting setValue:@(0.5) forKey:@"colorTintAlpha"];
    }
    if (self.grayscaleTintAlpha >= 0.0f) {
        [setting setValue:@(self.grayscaleTintAlpha) forKey:@"grayscaleTintAlpha"];
    }
    if (self.grayscaleTintLevel >= 0.0f) {
        [setting setValue:@(self.grayscaleTintLevel) forKey:@"grayscaleTintLevel"];
    }
    
    return setting;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    _customBlurEffect *effect = [super copyWithZone:zone];
    effect.blurRadius = self.blurRadius;
    effect.blurHardEdges = self.blurHardEdges;
    effect.colorTint = self.colorTint;
    effect.grayscaleTintLevel = self.grayscaleTintLevel;
    effect.grayscaleTintAlpha = self.grayscaleTintAlpha;
    
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
    
    [self attachEffectView];
}

- (void)attachEffectView {
    if (_effectView && _vibrancyView) {
        return;
    }
    
    _effectView = [[UIVisualEffectView alloc] init];
    [self insertSubview:_effectView atIndex:0];
    [self autoFullesize:_effectView];
    
    _vibrancyView = [[UIVisualEffectView alloc] init];
    [_effectView.contentView addSubview:_vibrancyView];
    [self autoFullesize:_vibrancyView];
    
    [self layoutIfNeeded];
}

#pragma mark - Public actions
- (void)presentEffect {
    [self presentEffect:UIBlurEffectStyleLight];
}
- (void)presentEffect: (UIBlurEffectStyle)style {
    [self presentEffect:style animationDuration:0.5];
}
- (void)presentEffectWithoutAnimation: (UIBlurEffectStyle)style {
    [self presentEffect:style animationDuration:0.0];
}
- (void)presentEffect: (UIBlurEffectStyle)style animationDuration:(double)duration{
    _blurEffect = (_customBlurEffect*)[_customBlurEffect effectWithStyle:style];
    void (^block)(void) = ^{
        [_effectView setEffect:_blurEffect];
        UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:_blurEffect];
        [_vibrancyView setEffect:vibrancy];
    };
    if (duration > 0.0f) {
        [UIView animateWithDuration:duration animations:block];
    } else {
        block();
    }
    
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
- (void)refreshEffectViews {
    [_effectView setEffect:_blurEffect];
    UIVibrancyEffect *vibrancy = [UIVibrancyEffect effectForBlurEffect:_blurEffect];
    [_vibrancyView setEffect:vibrancy];
}

#pragma mark - Vibrancy properties
@synthesize blurRadius;
- (float)blurRadius {
    if (_blurEffect) {
        return _blurEffect.blurRadius;
    } else {
        return -1;
    }
}
- (void)setBlurRadius:(float)newValue {
    if (_blurEffect) {
        [_blurEffect setBlurRadius:newValue];
        [self refreshEffectViews];
    }
}

@synthesize colorTint;
- (UIColor *)colorTint {
    if (_blurEffect) {
        return _blurEffect.colorTint;
    } else {
        return nil;
    }
}
- (void)setColorTint:(UIColor *)newValue {
    if (_blurEffect) {
        _blurEffect.colorTint = newValue;
        [self refreshEffectViews];
    }
}


@synthesize grayscaleTintAlpha;
- (float)grayscaleTintAlpha {
    if (_blurEffect) {
        return _blurEffect.grayscaleTintAlpha;
    } else {
        return -1;
    }
}
- (void)setGrayscaleTintAlpha:(float)newValue {
    if (_blurEffect) {
        _blurEffect.grayscaleTintAlpha = newValue;
        [self refreshEffectViews];
    }
}

@synthesize grayscaleTintLevel;
- (float)grayscaleTintLevel {
    if (_blurEffect) {
        return _blurEffect.grayscaleTintLevel;
    } else {
        return -1;
    }
}
- (void)setGrayscaleTintLevel:(float)newValue {
    if (_blurEffect) {
        _blurEffect.grayscaleTintLevel = newValue;
        [self refreshEffectViews];
    }
}


@end



////
//@property (nonatomic) BOOL appliesTintAndBlurSettings;
//@property (nonatomic) _UIBackdropView *backdrop;
//@property (getter=isBackdropVisible, nonatomic) BOOL backdropVisible;
//@property (nonatomic) float blurRadius;

//@property (nonatomic) int blurHardEdges;
//@property (nonatomic, copy) NSString *blurQuality;
//@property (nonatomic, retain) UIColor *colorTint;
//@property (nonatomic, readonly) UIColor *combinedTintColor;
//@property (nonatomic, retain) UIColor *legibleColor;

//@property (nonatomic) BOOL blursWithHardEdges;
//@property (nonatomic) float colorBurnTintAlpha;
//@property (nonatomic) float colorBurnTintLevel;
//@property (nonatomic, retain) UIImage *colorBurnTintMaskImage;
//@property (nonatomic) float colorOffsetAlpha;
//@property (nonatomic, retain) NSValue *colorOffsetMatrix;
//@property (nonatomic, retain) _UIBackdropColorSettings *colorSettings;
//@property (nonatomic) float colorTintAlpha;
//@property (nonatomic) float colorTintMaskAlpha;
//@property (nonatomic, retain) UIImage *colorTintMaskImage;
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

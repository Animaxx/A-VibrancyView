//
//  A_AdvancedVibrancyView.h
//  A_VibrancyView_Demo
//
//  Created by Animax Deng on 2/22/16.
//  Copyright © 2016 Animax Deng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface A_AdvancedVibrancyView : UIView

@property (nonatomic) IBInspectable NSInteger blurRadius;

- (void)presentEffectView;
- (void)presentEffectView: (UIBlurEffectStyle)style;
- (void)convertAllSubview;

@end

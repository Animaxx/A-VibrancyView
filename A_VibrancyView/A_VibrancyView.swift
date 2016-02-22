//
//  A_VibrancyView.swift
//  A_VibrancyView_Demo
//
//  Created by Animax Deng on 2/19/16.
//  Copyright © 2016 Animax Deng. All rights reserved.
//

import UIKit

class A_VibrancyView: UIView {
    private var blurEffect:UIBlurEffect? = nil
    private var effectView:UIVisualEffectView? = nil
    private var vibrancyView:UIVisualEffectView? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        
        self.presentEffectView()
    }
    
    func presentEffectView(style:UIBlurEffectStyle = .Light) {
        if self.blurEffect != nil && self.effectView != nil {
            return
        }
        
//        let customBlurEffectType =  (NSClassFromString("_UICustomBlurEffect")! as! NSObject.Type)
//        if customBlurEffectType.respondsToSelector(Selector("effectWithStyle:")) {
//            let method = class_getInstanceMethod(customBlurEffectType, Selector("effectWithStyle:"))
////            self.blurEffect = customBlurEffectType.performSelector(Selector("effectWithStyle:"), withObject: style) as? UIBlurEffect
//        }
        
//        self.blurEffect?.setValue(1.0, forKeyPath: "scale")
//        self.blurEffect?.setValue(25.0, forKeyPath: "blurRadius")
        
        self.blurEffect = UIBlurEffect(style: style)
        
        self.effectView = UIVisualEffectView(effect: self.blurEffect)
        
        if let effectview = self.effectView {
            self.insertSubview(effectview, atIndex: 0)
            self.autoFullsize(effectview)
            
            let vibrancy = UIVibrancyEffect(forBlurEffect: blurEffect!)
            self.vibrancyView = UIVisualEffectView(effect: vibrancy)
            self.vibrancyView?.frame = effectview.bounds
            self.vibrancyView?.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            effectview.contentView.addSubview(self.vibrancyView!)
        }
        
        self.layoutIfNeeded()
    }
    
    func convertAllSubview() {
        if let transparencyView = self.vibrancyView {
            for item in self.subviews {
                if item != self.effectView && item != self.vibrancyView {
                    transparencyView.contentView.addSubview(item)
                }
            }
        }
    }
    
    // MARK: Helping methods
    private func autoFullsize(subview:UIView) {
        if let superview = subview.superview {
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            superview.addConstraint(NSLayoutConstraint.init(item: superview, attribute: .Top, relatedBy: .Equal, toItem:subview , attribute: .Top, multiplier: 1.0, constant: 0))
            superview.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Bottom, relatedBy: .Equal, toItem: superview, attribute: .Bottom, multiplier: 1.0, constant: 0))
            superview.addConstraint(NSLayoutConstraint.init(item: superview, attribute: .Left, relatedBy: .Equal, toItem: subview, attribute: .Left, multiplier: 1.0, constant: 0))
            superview.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Right, relatedBy: .Equal, toItem: superview, attribute: .Right, multiplier: 1.0, constant: 0))
        }
    }
    
    // MARK: Blur properties
    @IBInspectable var alphaOfEffect: CGFloat {
        get {
//            if let blurEffect = self.blurEffect {
//                let setting = blurEffect.valueForKey("effectSettings")
//                let br = setting!.valueForKey("blurRadius")
//                return br as! CGFloat
//            } else {
//                return -1
//            }
            if let effectview = self.effectView {
                return effectview.alpha
            } else {
                return 1.0
            }
        }
        set {
            self.effectView?.alpha = newValue
            
            
//            let setting = self.blurEffect!.valueForKey("effectSettings")!
//            setting.setValue(newValue, forKey: "blurRadius")
//            
//            let br_s = setting.valueForKey("blurRadius")
//            
//            self.blurEffect!.setValue(setting, forKey: "effectSettings")
//            
//            let br = self.blurEffect?.valueForKey("effectSettings")?.valueForKey("blurRadius")
//            let setting2 = self.blurEffect!.valueForKey("effectSettings")!
//            self.effectView?.effect = self.blurEffect

            
            
            
//            if let blurEffect = self.blurEffect {
//                let setting = blurEffect.valueForKey("effectSettings")
//                setting?.setValue(newValue, forKey: "blurRadius")
//                blurEffect.setValue(setting!, forKey: "effectSettings")
//                
//                
//                let br = self.blurEffect?.valueForKey("effectSettings")?.valueForKey("blurRadius")
//                self.effectView?.effect = self.blurEffect
//            }
        }
    }
}
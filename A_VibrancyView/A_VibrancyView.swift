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
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        super.willMoveToSuperview(newSuperview)
        
        self.attachEffectView()
    }
    
    func presentEffect(style:UIBlurEffectStyle = .Light, animationDuration:Double = 0.5 ) {
        self.blurEffect = UIBlurEffect(style: style)
        
        let block = { () -> Void in
            self.effectView?.effect = self.blurEffect
            let vibrancy = UIVibrancyEffect(forBlurEffect: self.blurEffect!)
            self.vibrancyView?.effect = vibrancy
        }

        if (animationDuration > 0.0) {
            UIView.animateWithDuration(animationDuration, animations: block)
        } else {
            block()
        }
    }
    
    func attachEffectView() {
        if self.vibrancyView != nil && self.effectView != nil {
            return
        }
        self.effectView = UIVisualEffectView()
        
        if let effectview = self.effectView {
            self.insertSubview(effectview, atIndex: 0)
            self.autoFullsize(effectview)
            
            self.vibrancyView = UIVisualEffectView()
            effectview.contentView.addSubview(self.vibrancyView!)
            self.autoFullsize(self.vibrancyView!)
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
    func recoverAllSubview() {
        if let transparencyView = self.vibrancyView {
            for item in transparencyView.contentView.subviews {
                self.addSubview(item);
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
    
    // MARK: Custom properties
    @IBInspectable var alphaOfEffect: CGFloat {
        get {
            if let effectview = self.effectView {
                return effectview.alpha
            } else {
                return 1.0
            }
        }
        set {
            self.effectView?.alpha = newValue
        }
    }
}

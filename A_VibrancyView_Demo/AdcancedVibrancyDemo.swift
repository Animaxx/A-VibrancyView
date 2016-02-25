//
//  AdcancedVibrancyDemo.swift
//  A_VibrancyView_Demo
//
//  Created by Animax Deng on 2/22/16.
//  Copyright © 2016 Animax Deng. All rights reserved.
//

import UIKit

class AdcancedVibrancyDemo: UIViewController {

    @IBOutlet weak var vibrancyView: A_AdvancedVibrancyView!
    @IBOutlet weak var backgoundImage: UIImageView!
    
    @IBAction func onClickSubviewConvert(sender: AnyObject) {
        self.vibrancyView.convertAllSubview()
    }
    @IBAction func onChangeBlurSlider(sender: UISlider) {
        self.vibrancyView.blurRadius = sender.value
    }
    @IBAction func onChangeGrayscaleTintAlpha(sender: UISlider) {
        self.vibrancyView.grayscaleTintAlpha = sender.value
    }
    @IBAction func onChangeGrayscaleTintLevel(sender: UISlider) {
        self.vibrancyView.grayscaleTintLevel = sender.value
    }
    
    @IBAction func onClickLightBlurEffect(sender: AnyObject) {
        self.vibrancyView.presentEffect()
    }
    @IBAction func onClickDarkBlurEffect(sender: AnyObject) {
        self.vibrancyView.presentEffect(.Dark, animationDuration: 0)
    }
    @IBAction func onClickExtraLightBlurEffect(sender: AnyObject) {
        self.vibrancyView.presentEffect(.ExtraLight)
    }
    
    @IBAction func onClickExit(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onChangeBackgound(sender: UISegmentedControl) {
        self.backgoundImage?.image = UIImage(named: sender.selectedSegmentIndex == 0 ? "background" : "background2")
    }
}
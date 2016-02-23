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
    
    @IBAction func onClickSubviewConvert(sender: AnyObject) {
        self.vibrancyView.convertAllSubview()
    }
    @IBAction func onChangeBlurSlider(sender: UISlider) {
        self.vibrancyView.blurRadius = Int(sender.value)
    }
    
    @IBAction func onClickExit(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

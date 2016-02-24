//
//  ViewController.swift
//  A_VibrancyView_Demo
//
//  Created by Animax Deng on 2/19/16.
//  Copyright © 2016 Animax Deng. All rights reserved.
//

import UIKit

class VibranctDemo: UIViewController {
    
    @IBOutlet weak var vibrancyView: A_VibrancyView!
    @IBOutlet weak var blurRadiusSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func onChangeEffectAlpha(sender: UISlider) {
        self.vibrancyView.alphaOfEffect = CGFloat(sender.value)
    }
    
    @IBAction func onClickSubviewConvert(sender: AnyObject) {
        self.vibrancyView.convertAllSubview()
    }
    @IBAction func onClickRecover(sender: AnyObject) {
        self.vibrancyView.recoverAllSubview()
    }
    
    

}


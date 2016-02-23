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

    @IBAction func onClickSubviewConvert(sender: AnyObject) {
        self.vibrancyView.convertAllSubview()
    }
    @IBAction func onChangeEffectAlpha(sender: UISlider) {
        self.vibrancyView.alphaOfEffect = CGFloat(sender.value)
    }
}


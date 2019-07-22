//
//  FourthViewController.swift
//  TabBarApplication
//
//  Created by apple on 2019/7/12.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
class FourthViewController:UIViewController
{
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider)
    {
        print(sender.value)
    }
    
    override func viewDidLoad()
    {
        view.backgroundColor = .orange
    }
}


//
//  ViewController.swift
//  UISlider
//
//  Created by apple on 2019/7/8.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    
    @IBAction func silderChanged(_ sender: UISlider)
    {
        //数字变字串
       myLabel.text = "\(Int(sender.value))"
    }
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myLabel.text = "50"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


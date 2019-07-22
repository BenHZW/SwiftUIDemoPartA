//
//  ViewController.swift
//  TabBar2
//
//  Created by apple on 2019/7/12.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myLabel.text = "firstView"
        if let secondViewController = self.tabBarController?.viewControllers?[1] as? NewViewController
        {
            secondViewController.messageFromViewOne = "Hi"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


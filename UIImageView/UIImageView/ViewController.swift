//
//  ViewController.swift
//  UIImageView
//
//  Created by apple on 2019/7/9.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myPet: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //写法等效
//        myPet.image = UIImage(named: "MyDog")
        myPet.image = #imageLiteral(resourceName: "MyCat")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


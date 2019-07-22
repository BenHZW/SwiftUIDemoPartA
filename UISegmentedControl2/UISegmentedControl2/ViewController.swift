//
//  ViewController.swift
//  UISegmentedControl2
//
//  Created by apple on 2019/7/8.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBAction func changeTheType(_ sender: UISegmentedControl)
    {
//        if sender.selectedSegmentIndex == 0
//        {
//            self.view.backgroundColor = UIColor.white
//        }
//        else if sender.selectedSegmentIndex == 1
//        {
//            self.view.backgroundColor = UIColor.black
//        }
//        else if sender.selectedSegmentIndex == 2
//        {
//            self.view.backgroundColor = UIColor.red
//        }
//        else if sender.selectedSegmentIndex == 3
//        {
//            self.view.backgroundColor = UIColor.orange
//        }
//        else
//        {
//            self.view.backgroundColor = UIColor.yellow
//        }
        switch sender.selectedSegmentIndex
        {
        case 0:
            self.view.backgroundColor = .white
        case 1:
            self.view.backgroundColor = .black
        case 2:
             self.view.backgroundColor = .red
        case 3:
            self.view.backgroundColor = .orange
        default:
            self.view.backgroundColor = .yellow
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


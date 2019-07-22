//
//  ViewController.swift
//  UISwitch
//
//  Created by apple on 2019/7/8.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    @IBAction func makeAChange(_ sender: UISwitch)
    {
        //用isOn检查开关状态
        if sender.isOn == true
        {
            print("It's On")
            view.backgroundColor = .white
        }
        else
        {
            print("It's off")
            view.backgroundColor = .black
        }
    }
    
    @objc func codeSwitchChanged(_ sender:UISwitch)
    {
        //用isOn检查开关状态
        if sender.isOn == true
        {
            print("It's On")
            view.backgroundColor = .white
        }
        else
        {
            print("It's off")
            view.backgroundColor = .black
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mySwitch.isOn = false
        makeAChange(mySwitch)
        
     let codeSwitch =   UISwitch(frame: CGRect(x: view.frame.midX - 51 / 2, y: view.frame.maxY - 100, width: 51, height: 31))
        view.addSubview(codeSwitch)
        codeSwitch.isOn = true
        codeSwitch .addTarget(self, action: #selector(ViewController.codeSwitchChanged(_:)), for: .valueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


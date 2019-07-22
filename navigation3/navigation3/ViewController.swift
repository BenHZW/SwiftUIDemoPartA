//
//  ViewController.swift
//  navigation3
//
//  Created by apple on 2019/7/12.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goToView2(_ sender: UIButton)
    {
        //从storyboard中找到控件
       let lightRed = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LightRed")
         //从上至下切换
        //present(lightRed, animated: true,completion: nil)
        
        //从左到右
        self.navigationController?.pushViewController(lightRed, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


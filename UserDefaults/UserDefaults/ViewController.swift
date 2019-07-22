//
//  ViewController.swift
//  UserDefaults
//
//  Created by apple on 2019/7/15.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //存储，存任何类型
       // UserDefaults.standard.set("aa", forKey: "name")
        
        //读取
        if let loadName = UserDefaults.standard.value(forKey: "name") as? String
        {
            print(loadName)
        }
        
        //存储同上
        let fruitArray = ["apple","banana","mango"]
        UserDefaults.standard.set(fruitArray, forKey: "sweetFruit")
        
       //或者Standard.Array或Standard.StringAraay
        if let loadFruit = UserDefaults.standard.value(forKey: "sweetFruit") as? [String]
        {
            print(loadFruit)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


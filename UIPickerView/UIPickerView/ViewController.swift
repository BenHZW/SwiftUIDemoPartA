//
//  ViewController.swift
//  UIPickerView
//
//  Created by apple on 2019/7/9.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate
{
    let numberArray = ["1","2","3","4","5","6","7","8"]
    let fruitArray = ["apple","banana","mango","watermelon"]
    
    //必执行协议1
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        //有多少类选项
        return 2
    }
    
    //必执行协议2
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        //每个类选项有多少个行
        if component == 0
        {
            return numberArray.count
        }
        else
        {
            return fruitArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if component == 0
        {
        return numberArray[row]
        }
        else
        {
            return fruitArray[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if component == 0
        {
            print("number: \(numberArray[row])")
        }
        else
        {
            print("fruit: \(fruitArray[row])")
        }
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


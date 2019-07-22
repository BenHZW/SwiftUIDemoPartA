//
//  ViewController.swift
//  PrimeNumber
//
//  Created by apple on 2019/7/5.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    //上面状态栏跟view背景颜色一样
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    @IBAction func doThePrimeText(_ sender: UIButton)
    {
        //1.从TextField拿文字
        //2.字符串转换数字
        //3.判断
        //4.显示结果
        
         //A.检测是否有输入内容
        if let inputText = inputTextField.text,let inputNumber = Int(inputText)
        {
           //B.检测是否输入的是数字
           
          
            checkPrime(withNumber: inputNumber)
            {
                self.resultLabel.text = $0
                self.resultLabel.isHidden = false
            }
        }
       inputTextField.text = ""
    }
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //进去先弹键盘
        inputTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkPrime(withNumber testNumber:Int) -> String
    {
        var isPrime : Bool? = true
        
        if testNumber <= 1
        {
            isPrime = nil
        }
        else
        {
            for i in 2..<testNumber
            {
                if testNumber % i == 0
                {
                    //不是质数
                    isPrime = false
                    //条件不符快速跳出该循环
                    break
                }
            }
        }
        if isPrime == true
        {
            return("\(testNumber)是质数")
        }
        else if isPrime == false
        {
            return("\(testNumber)不是质数")
        }
        else
        {
            return("请重新输入非0和1的数")
        }
    }
    
    //函数名相同参数不一样为不同的函数
    func checkPrime(withNumber number: Int,andCompletionHadler handler:(String)->())
    {
        handler(checkPrime(withNumber: number)
)
    }
}


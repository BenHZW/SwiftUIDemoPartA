//
//  ViewController.swift
//  NumberLock
//
//  Created by apple on 2019/7/1.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController
{
    var counter = 0.0
    
    var timer = Timer()
    
    var timeIsRunning = false
    
    var maxNumber = 100
    
    var minNumber = 1
    
    var isOver = false
    
    //更爱状态列颜色
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    /*GKRandomSource.sharedRandom().nextInt(upperBound: 100) //得到0-99的乱数*/
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1//得到1-100的乱数
    
    @IBOutlet weak var messageLable: UILabel!
    
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var background: UIImageView!
    
    
    @IBAction func makeAGuess(_ sender: UIButton)
    {
        //正在计数
        if timeIsRunning == true
        {
            print("正在运行，不作操作")
        }
        else
        {
            //没开始
            print("重置时间")
            counter = 0.0
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            timeIsRunning = true
        }
        
        //正在玩游戏
        if isOver == false
        {
            print(answer)
            //把使用者输入的文字拿出来
            let inputText = inputTextField.text!
            
            inputTextField.text = ""
            
            let inputNumber = Int(inputText)
            if inputNumber == nil
            {
                //输入错误
                messageLable.text = "没有输入数字!请输入\(minNumber) ~ \(maxNumber)之间的数字"
            }
            else
            {
                //输入答案
                if inputNumber! > 100
                {
                    //输入太大
                    messageLable.text = "太大了！请输入\(minNumber) ~ \(maxNumber)之间的数字"
                }
                else if inputNumber! < 1
                {
                    //输入太小
                    messageLable.text = "太小了！请输入\(minNumber) ~ \(maxNumber)之间的数字"
                }
                else if inputNumber! == answer
                {
                    //猜中
                    let correctNumber = String(format: "%.1f", counter)
                    messageLable.text = "恭喜猜对了，用时一共\(correctNumber)秒,按【猜一猜】重新进行游戏吧"
                    
                    //游戏结束时间停止
                    timer.invalidate()
                    print(counter)
                    
                    isOver = true
                    
                    background.image = UIImage(named: "Finish")
                }
                else
                {
                    //检查答案
                    if inputNumber! > answer
                    {
                        maxNumber = inputNumber!
                    }
                    else
                    {
                        minNumber = inputNumber!
                    }
                    messageLable.text = "接近了，请输入\(minNumber) ~ \(maxNumber)之间的数字"
            
                }
            }
        }
        
        else
        {
            //游戏结束
            maxNumber = 100
            minNumber = 1
            messageLable.text = "请输入一个\(minNumber) ~ \(maxNumber)之间的数字"
            answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
            isOver = false
            timeIsRunning = false
            background.image = UIImage(named: "BG")

        }
        
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        //让键盘自动跳出
        inputTextField.becomeFirstResponder()
        print("初始化时间为\(counter)")
    }

    //更新时间
    @objc func updateTimer()
    {
        counter = counter + 0.1
        print(counter)
        let time = String(format: "%.1f", counter)
        print(time)
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 
}


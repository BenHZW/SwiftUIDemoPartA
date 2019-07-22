//
//  ViewController.swift
//  FortuneTeller
//
//  Created by apple on 2019/7/9.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
//随机数
import GameKit
import AudioToolbox



class ViewController: UIViewController
{
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }

    @IBOutlet weak var yourFortune: UIImageView!
    
    
    
    @IBAction func tellMeSomething(_ sender: UIButton)
    {
        showAnswer()
        print("按了")
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?)
    {
        if event?.subtype == .motionShake
        {
            showAnswer()
        }
    }
    
    
    func showAnswer()
    {
       //展示图片
        if yourFortune.isHidden == true
        {
        //1.取1~6的乱数
        let answer = GKRandomSource.sharedRandom().nextInt(upperBound:6) + 1
        
        //更改图片
      yourFortune.image =  UIImage(named:"\(answer)")
            yourFortune.isHidden = false
            AudioServicesPlaySystemSound(1000)
        }
            //隐藏图片
         else
        {
            yourFortune.isHidden = true
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


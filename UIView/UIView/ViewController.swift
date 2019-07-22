//
//  ViewController.swift
//  UIView
//
//  Created by apple on 2019/7/7.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var midRect: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //背景颜色
        midRect.backgroundColor = UIColor.green
        //透明度
        midRect.alpha = 0.5
        //隐藏
        midRect.isHidden = true
        
        self.view.backgroundColor = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1)
        
       //在storyboard中使用tag值指定view
        //self.view.viewWithTag(101)?.backgroundColor = UIColor.lightGray
        let viewArea = CGRect(x:50,y:400,width:100,height:50)
        let smallRect = UIView(frame: viewArea)
        smallRect.backgroundColor = UIColor.purple
        //自视图加在父视图如果超越不会被遮掩
        view.addSubview(smallRect)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


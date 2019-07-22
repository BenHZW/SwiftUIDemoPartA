//
//  ViewController.swift
//  UIButton
//
//  Created by apple on 2019/7/9.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let codeButton:UIButton =
    {
        //系统按钮
        let newButton = UIButton(type: .system)
        newButton.frame = CGRect(x: 50, y: 50, width: 100, height: 50)
        newButton.setTitle("Press", for: .normal)
        newButton.setTitle("Pressinng", for: .highlighted)
        newButton.addTarget(self, action: #selector(ViewController.hitMe(_thisButton:)), for: .touchUpInside)
        return newButton
    }()
    
    let anotherButton:UIButton = {
        //客制化按钮
        let anotherButton = UIButton(type: .custom)
        anotherButton.frame = CGRect(x: 200, y: 200, width: 144, height: 51)
        anotherButton.setImage(UIImage(named:"PlayButton"), for: .normal)
        anotherButton.setImage(UIImage(named: "PlayButtonPressed"), for: .highlighted)
        anotherButton.addTarget(self, action: #selector(ViewController.hitMe(_thisButton:)), for: .touchUpInside)
        return anotherButton
    }()
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        print("Hello World")
    }
    
    @objc func hitMe(_thisButton:UIButton)
    {
        print("what's up?")
    }
    
    func setUpUI()
    {
        view.addSubview(codeButton)
        
        view.addSubview(anotherButton)

    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpUI()
        
       
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


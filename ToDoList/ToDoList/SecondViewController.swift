//
//  SecondViewController.swift
//  ToDoList
//
//  Created by apple on 2019/7/16.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    //需要修改的行(第几行)
    var infoFromViewOne:Int?
    
    @IBOutlet weak var myTextInput: UITextField!
    
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBAction func buttonPress(_ sender: UIButton)
    {
        if let text = myTextInput.text
        {
            //guard确保条件允许
            guard let firstViewController = tabBarController?.viewControllers?[0] as? FirstViewController
                else
            {
                return
            }
            
            if text != ""
            {
                if infoFromViewOne != nil
                {
                    firstViewController.toDos[infoFromViewOne!] = text
                    infoFromViewOne = nil
                }
                else
                {
                    //加元素
                    firstViewController.toDos.append(text)
                }
                
                    firstViewController.myTableView.reloadData()
                   //存资料
                    UserDefaults.standard.set(firstViewController.toDos, forKey: "todos")
            }
            else
            {
                if infoFromViewOne != nil
                {
                    firstViewController.toDos.remove(at: infoFromViewOne!)
                    firstViewController.myTableView.reloadData()
                    //存资料
                    UserDefaults.standard.set(firstViewController.toDos, forKey: "todos")
                    infoFromViewOne = nil
                }
            }
        }
        myTextInput.text = ""
        myButton.setTitle("Back", for: .normal)
        self.tabBarController?.selectedIndex = 0
    }
    
 
    
    @IBAction func textFieldDidChanged(_ sender: UITextField)
    {
        if sender.text != ""
        {
            myButton.setTitle("OK", for: .normal)
        }
        else
        {
            myButton.setTitle("Back", for: .normal)
        }
    }
    
    //return键能否收起
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        buttonPress(UIButton())
        return true
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTextInput.becomeFirstResponder()
        myTextInput.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        //修改状态
        if infoFromViewOne != nil
        {
            if let firstViewController = tabBarController?.viewControllers?[0] as? FirstViewController
            {
                myTextInput.text = firstViewController.toDos[infoFromViewOne!]
                myButton.setTitle("OK", for: .normal)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


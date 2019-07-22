//
//  ViewController.swift
//  UIAlertController
//
//  Created by apple on 2019/7/9.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlert(_ sender: UIButton)
    {
      let myAlert =  UIAlertController(title: "Hello", message: "How are you", preferredStyle: .actionSheet)
        
        //第一个按钮
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
           self.dismiss(animated: true, completion: nil)
        }
        
        //第二个按钮
        let helloAction = UIAlertAction(title: "say Hello", style: .destructive) { (action:UIAlertAction) in
            print("hello")
            self.dismiss(animated: true, completion: nil)
        }
        
        //第三个按钮
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (action:UIAlertAction) in
            print("cancel")
            self.dismiss(animated: true, completion: nil)
        }
        
        
        //添加按钮
        myAlert.addAction(okAction)
        myAlert.addAction(helloAction)
        myAlert.addAction(cancelAction)
        
        //呈现
        present(myAlert,animated: true,completion: nil)
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


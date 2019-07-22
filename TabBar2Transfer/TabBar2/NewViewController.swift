//
//  NewViewController.swift
//  TabBar2
//
//  Created by apple on 2019/7/12.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class NewViewController: UIViewController
{
    var messageFromViewOne:String?
    
    @IBOutlet weak var myTextInput: UITextField!
    
    @IBAction func ok(_ sender: UIButton)
    {
        if let inputText = myTextInput.text
        {
            print("inputText")
            myTextInput.text = ""
            myTextInput.resignFirstResponder()
            let firstViewController = self.tabBarController?.viewControllers?[0] as? ViewController
            firstViewController?.myLabel.text = inputText
            //选择当前页面(转换成第一个controller)
            self.tabBarController?.selectedIndex = 0
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("执行了一次")
        myTextInput.becomeFirstResponder()
        myTextInput.text = messageFromViewOne
    }

    override func viewDidDisappear(_ animated: Bool)
    {
        super.viewDidDisappear(animated)
        myTextInput.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

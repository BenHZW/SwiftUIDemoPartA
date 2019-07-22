//
//  LightGreenViewController.swift
//  navigation3
//
//  Created by apple on 2019/7/12.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class LightGreenViewController: UIViewController
{

    
    @IBAction func backTo2(_ sender: UIButton)
    {
        //push进来才能返回去
        //navigationController?.popViewController(animated: true)
//        navigationController?.popToRootViewController(animated: true)
        
        //上下present出来的返回去用dismiss
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

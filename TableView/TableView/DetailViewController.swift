//
//  DetailViewController.swift
//  TableView
//
//  Created by apple on 2019/7/15.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    var infoFromViewOne:String?
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
        if let okFileName = infoFromViewOne
        {
            myImageView.image = UIImage(named: okFileName)
        }
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

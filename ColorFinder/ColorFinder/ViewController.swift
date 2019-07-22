//
//  ViewController.swift
//  ColorFinder
//
//  Created by apple on 2019/7/8.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var redValue = 255
    var greenValue = 255
    var blueValue = 255
    
    
    @IBOutlet weak var redText: UILabel!
    
    @IBOutlet weak var greenText: UILabel!
    
    @IBOutlet weak var blueText: UILabel!
    
    @IBAction func greenSliderChanged(_ sender: UISlider)
    {
        greenValue = Int(sender.value)
        greenText.text = "R:\(greenValue)"
        changeBackgroundColor()
    }
    
    
    @IBAction func redSliderChanged(_ sender: UISlider)
    {
        redValue = Int(sender.value)
        redText.text = "R:\(redValue)"
        changeBackgroundColor()
    }
    
    
    @IBAction func blueSliderChanged(_ sender: UISlider)
    {
        blueValue = Int(sender.value)
        blueText.text = "R:\(blueValue)"
        changeBackgroundColor()
    }
    
    
    func changeBackgroundColor()
    {
        view.backgroundColor = UIColor(red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: 1)
        if(redValue == 0 && blueValue == 0 && greenValue == 0)
        {
            redText.textColor = .white
            blueText.textColor = .white
            greenText.textColor = .white
        }
        else
        {
            redText.textColor = .black
            blueText.textColor = .black
            greenText.textColor = .black
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


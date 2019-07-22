//
//  ViewController.swift
//  Xylophone
//
//  Created by Benson on 2017/7/11.
//  Copyright © 2019年 appsgaga. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var audioMatrix:[AVAudioPlayer?] = [AVAudioPlayer?]()
    
    @IBAction func playSound(_ sender: UIButton)
    {
        audioMatrix[sender.tag]?.stop()
        audioMatrix[sender.tag]?.currentTime = 0.0
        audioMatrix[sender.tag]?.play()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        for i in 0...7
        {
            guard let path = Bundle.main.path(forResource: "\(i+1)", ofType: "mp3")
            else
            {
                audioMatrix.append(nil)
                return
            }
            let url = URL(fileURLWithPath: path)
            do
            {
                audioMatrix.append(try AVAudioPlayer(contentsOf: url))
            }
            catch
            {
                audioMatrix.append(nil)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


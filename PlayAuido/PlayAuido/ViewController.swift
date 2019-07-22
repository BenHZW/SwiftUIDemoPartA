//
//  ViewController.swift
//  PlayAuido
//
//  Created by apple on 2019/7/10.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?
    
    @IBAction func play(_ sender: UIButton)
    {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //播放属性
   /*
        //找出音档路径(opional)
     if let path = Bundle.main.path(forResource: "Right", ofType: "mp3")
     {//路径转换成url
       let url = URL(fileURLWithPath: path)
        do{
             //产生音档文件
             audioPlayer = try AVAudioPlayer(contentsOf: url)
            //播放速度
            audioPlayer?.enableRate = true
            audioPlayer?.rate = 0.5
            
            //播放次数(负数为无限次)
            audioPlayer?.numberOfLoops = -1
            
            //声音
            audioPlayer?.volume = 0.3
        }
        catch
        {
            //拿到错误的叙述error
            print(error.localizedDescription)
        }
     }
        else
     {
        print("没有这个文件")
     }
 */
        //gurad确保某一样东西一定能成功，否则else
        guard  let newPath = Bundle.main.path(forResource: "Right", ofType: "mp3")

        else
        {
            print("no such path")
            return
        }
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: newPath))
        }
       catch
       {
        print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


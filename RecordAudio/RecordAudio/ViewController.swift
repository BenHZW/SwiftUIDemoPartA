//
//  ViewController.swift
//  RecordAudio
//
//  Created by apple on 2019/7/10.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
import AVFoundation

//音讯模式
enum AudioSessionMode
{
    case record
    case play
}

class ViewController: UIViewController,AVAudioRecorderDelegate{
    var recordHelper:RecordHelper?
 
    
    @IBAction func recordAudio(_ sender: UIButton)
    {
        recordHelper?.recordAudio()
    }
    
    @IBAction func stopRecording(_ sender: UIButton)
    {
        recordHelper?.stopRecording()
    }
    
    @IBAction func playRecordedSound(_ sender: UIButton)
    {
        recordHelper?.playRecordedSound()
    }
    
    
    @IBAction func stopPlaying(_ sender: UIButton)
    {
        recordHelper?.stopRecording()
    }
    
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        recordHelper = RecordHelper()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


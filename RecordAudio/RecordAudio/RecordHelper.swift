//
//  RecordHelper.swift
//  RecordAudio
//
//  Created by apple on 2019/7/11.
//  Copyright © 2019年 Benson. All rights reserved.
//

import Foundation
import AVFoundation

//真机:选择plist：最后一列Supported interface orientations (iPad)，按加号选择Privacy - Microphone Usage Description + value备注
class RecordHelper:NSObject,AVAudioRecorderDelegate
{
    var audioRecorder:AVAudioRecorder?
    var audioPlayer:AVAudioPlayer?
    var isRecording = false
    
    //调整录音工作阶段模式:传入音讯模式参数
    func settingAudioSession(toMode mode:AudioSessionMode)
    {
        audioPlayer?.stop()
        //音讯工作阶段
        let session = AVAudioSession.sharedInstance()
        do
        {
            switch mode {
            case .record:
                try
                    session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            case .play:
                try session.setCategory(AVAudioSessionCategoryPlayback)
            }
            try session.setActive(false)
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder:AVAudioRecorder,successfully flag:Bool)
    {
        if flag == true
        {
            do
            {
                //用产生好的url放到audioPlayer
                audioPlayer = try AVAudioPlayer(contentsOf: recorder.url)
            }
            catch
            {
                
            }
        }
    }
    
    func recordAudio()
    {
        settingAudioSession(toMode: .record)
        audioRecorder?.prepareToRecord()
        audioRecorder?.record()
        isRecording = true
    }
    
     func stopRecording()
    {
        if audioRecorder != nil
        {
            audioRecorder?.stop()
            isRecording = false
            settingAudioSession(toMode: .play)
        }
    }
    
     func playRecordedSound()
    {
        if isRecording == false
        {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
            audioPlayer?.play()
        }
    }
    
    
   func stopPlaying()
    {
        if isRecording == false
        {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
        }
    }
    
    
    override init()
    {
        super.init()
        //初始化audio recorder
        let fileName = "User.wav"
        //找到录音存档路径
        let path = NSHomeDirectory() + "/Documents/" + fileName
        //转换成url
        let url = URL(fileURLWithPath: path)
        //设定录音品质
        let recordSettings:[String:Any] = [AVEncoderAudioQualityKey:AVAudioQuality.min.rawValue,AVEncoderBitRateKey:16,AVNumberOfChannelsKey:2,AVSampleRateKey:44100.0]
        do
        {
            audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
            audioRecorder?.delegate = self
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
}

//
//  ViewController.swift
//  DownloadImage
//
//  Created by apple on 2019/7/16.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var myImageView: UIImageView!
    
    var session : URLSession?
    
    //使用Session下载资料:1.产生URLSession对象 2.呼叫Session的dataTask 3.呼叫dataTask的resume就开始下载
    override func viewDidLoad()
    {
        super.viewDidLoad()
        session = URLSession(configuration: .default)
        
        let imageAddrss = "https://blog.tomasmahrik.com/wp-content/uploads/2015/06/swift.jpg"
       if let imageUrl =  URL(string: imageAddrss)
       {
        //回传dataTask实体，下载完再执行闭包，使用session预设在共时伫列中下载
        /*使用dataTask下载(下载完是url)偏好文字下载
        let task = session?.dataTask(with: imageUrl, completionHandler: { (data, response, error) in
            if error != nil
            {
                print(error!.localizedDescription)
                return
            }
            if let loadedData = data
            {
              let loadedImage = UIImage(data: loadedData)
                DispatchQueue.main.async {
                   self.myImageView.image = loadedImage
                }
            }
            
        })
        //开始下载
        task?.resume()
     */
        //使用downloadTask下载(下载完是data)偏好图片资料下载
        //下载完成再调用闭包，边下载边保存data
        let newTask = session?.downloadTask(with: imageUrl, completionHandler: { (url, response, error) in
            if error != nil
            {
                //获取错误原因的代码
                let errorCode = (error! as NSError).code
                if errorCode == -1009
                {
                    print("no internet connection")
                }
                else
                {
                    print(error!.localizedDescription)
                }
                return
            }
            if let loadedURL = url
            {
               do
               {
                  let loadedImage = UIImage(data: try Data(contentsOf: loadedURL))
                DispatchQueue.main.async {
                    self.myImageView.image = loadedImage
                }
               }
                catch
                {
                    print(error.localizedDescription)
                }
            }
        })
       newTask?.resume()
        
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


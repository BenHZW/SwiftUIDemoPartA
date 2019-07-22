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
        
    
    //使用data下载资料:1.网址转换成url 2.url下载data 3.使用下载的data产生图片，下载图片需要使用共时伫列
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let imageAddrss = "https://blog.tomasmahrik.com/wp-content/uploads/2015/06/swift.jpg"
       if let imageUrl =  URL(string: imageAddrss)
       {
        //共时伫列同步
        DispatchQueue.global().async
            {
                do{
                    //在闭包里面属性需要加self
                    let downlodImage = UIImage(data: try Data(contentsOf: imageUrl))
                    //跟UI显示相关的使用异步
                    DispatchQueue.main.async
                        {
                            self.myImageView.image = downlodImage
                    }
                }
                catch
                {
                    print(error.localizedDescription)
                }
            }
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


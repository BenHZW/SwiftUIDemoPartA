//
//  ViewController.swift
//  WKWebView
//
//  Created by apple on 2019/7/16.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
import WebKit

//显示一些本来显示不了的网站:info.plist最下面加一行App Transport Security Settings在里面加Allow Arbitrary Loads改属性YES
class ViewController: UIViewController,WKNavigationDelegate
{

    @IBOutlet weak var myWebView: WKWebView!
    
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myWebView.navigationDelegate = self
        //1.url 2.建立请求 3.连接
        if let url = URL(string: "https://www.baidu.com")
        {
            let request = URLRequest(url: url)
            myWebView.load(request)
        }
    }

    //网页刚开始载入
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!)
    {
        //开始转
        myActivityIndicator.startAnimating()
    }
    
   //网页结束载入
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!)
    {
        //停止转
        myActivityIndicator.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


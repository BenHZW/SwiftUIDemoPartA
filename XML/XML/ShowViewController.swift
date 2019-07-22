//
//  ShowViewController.swift
//  XML
//
//  Created by apple on 2019/7/19.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
import WebKit

class ShowViewController: UIViewController,WKNavigationDelegate
{

    var linkFromViewOne:String?
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //使用代理方法
        myWebView.navigationDelegate = self
        
        if let myString = linkFromViewOne
        {
          if let url = URL(string: myString)
          {
              let request = URLRequest(url: url)
              myWebView.load(request)
          }
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
    
    override func didReceiveMemoryWarning()
    {
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

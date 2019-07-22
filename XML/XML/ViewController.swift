//
//  ViewController.swift
//  XML
//
//  Created by apple on 2019/7/19.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

struct NewsItem
{
    var title : String?
    var link : String?
}

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    //数据源
    var objects = [NewsItem]()
    let xmlAddress = "https://www.cnet.com/rss/news/"
    
    var session = URLSession(configuration: .default)
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        downloadXML(withXMLAddress: xmlAddress)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //取消选取
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = objects[indexPath.row].title
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showInfo"
        {
            let svc = segue.destination as? ShowViewController
            //传值到showView
            
            //获取点击哪一行
           if let selectedRow = myTableView.indexPathForSelectedRow?.row
            {
               svc?.linkFromViewOne = objects[selectedRow].link
            }
        }
    }
    
    //下载方法
    func downloadXML(withXMLAddress xmlAddress:String)
    {
      if let url = URL(string: xmlAddress)
      {
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil
            {
                DispatchQueue.main.async
                {
                    self.popAlert(withTitle: "Sorry")
                }
         
                return
            }
            if let okData = data
            {
                //解析XML
                let parser = XMLParser(data: okData)
                //data变文字
                //print(NSString(data: okData, encoding: String.Encoding.utf8.rawValue))
                let rssPaserDelegate = RSSParserDelegate()
                parser.delegate = rssPaserDelegate
                if parser.parse() == true
                {
                   self.objects = rssPaserDelegate.getResult()
                    DispatchQueue.main.async
                    {
                      self.myTableView.reloadData()
                    }
                }
                 else
                {
                    print("解析失败")
                }
                
            }
        }
        task.resume()
      }
    }

    
    //跳出警告控制器
    func popAlert(withTitle title:String)
    {
        let alert = UIAlertController(title: title, message: "请稍后再试", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    
    
    
    
    
}


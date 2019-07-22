//
//  ViewController.swift
//  TableView
//
//  Created by apple on 2019/7/15.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //数据源
    let fruitArray = ["apple","banana","mango","watermelon"]
    let colorArray = ["red","green","blue"]
    func numberOfSections(in tableView: UITableView) -> Int
    {
        //多个section需要在storyboard中style换grouped
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return fruitArray.count

        }
        else
        {
            return colorArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {   //indexPath.section
        //indexPath.row
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0
        {
             cell.textLabel?.text = fruitArray[indexPath.row]
        }
        else
        {
        cell.textLabel?.text = colorArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Fruit"
        }
        else
        {
            return "COLOR"
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


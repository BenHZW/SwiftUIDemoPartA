//
//  RSSParserDelegate.swift
//  XML
//
//  Created by apple on 2019/7/19.
//  Copyright © 2019年 Benson. All rights reserved.
//

import Foundation

class RSSParserDelegate:NSObject,XMLParserDelegate
{
    //当前存解析到的新闻
    var currentItem : NewsItem?
    //当前存解析到的文字
    var currentElementValue :String?
    //存解析到的最终结果
    var resultArray = [NewsItem]()
    
    //碰到任何开始标签执行
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        //开始标签为item
        if elementName == "item"
        {
            currentItem = NewsItem()
        }
        else if elementName == "title"
        {
            currentElementValue = nil
        }
        else if elementName == "link"
        {
            currentElementValue = nil
        }
    }
    
    //碰到任何结束标签执行
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        //结束标签为item
        if elementName == "item"
        {
            if currentItem != nil
            {
                //数组真正添加元素
                resultArray.append(currentItem!)
                currentItem = nil
            }
        }else if elementName == "title"{
            currentItem?.title = currentElementValue
        }else if elementName == "link"{
            currentItem?.link = currentElementValue
        }
        currentElementValue = nil
    }
    
    //碰到start后不断执行直到碰到end结束标签为止
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if currentElementValue == nil
        {
            currentElementValue = string
        }
        else
        {
            currentElementValue = currentElementValue! + string
        }
    }
    
    func getResult() -> [NewsItem]
    {
        return resultArray
    }
    
}


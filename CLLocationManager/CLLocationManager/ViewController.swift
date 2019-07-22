//
//  ViewController.swift
//  CLLocationManager
//
//  Created by apple on 2019/7/11.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
//需要在info.plist加上Privacy - Location When In Use Usage Description
class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var locationManager:CLLocationManager?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //获取坐标
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        
        //设置代理
        locationManager?.delegate = self
        //设置当前位置准确性
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        //活动模式
        locationManager?.activityType = .automotiveNavigation
        locationManager?.startUpdatingLocation()
        
        //显示
        if let coordinate = locationManager?.location?.coordinate
        {
        let xScale:CLLocationDegrees = 0.01
        let yScale:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
           let region = MKCoordinateRegion(center: coordinate, span: span)
            map.setRegion(region, animated: true)
        }
        
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        locations[0].coordinate
        print("-------------")
        print( locations[0].coordinate.latitude)
        print(locations[0].coordinate.longitude)
    }
    
    override func viewDidDisappear(_ animated: Bool)
    {
        locationManager?.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  MKMapView
//
//  Created by apple on 2019/7/11.
//  Copyright © 2019年 Benson. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    
    @IBOutlet weak var map: MKMapView!
    
    
    @IBAction func addMeAnnotation(_ sender: UILongPressGestureRecognizer)
    {
        //当前手指位置
        let touchPoint = sender.location(in: map)
        //当前手指坐标
        let touchCoordinate = map.convert(touchPoint, toCoordinateFrom: map)
        //产生大头针
        let annotation = MKPointAnnotation()
        annotation.coordinate = touchCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "One day I wanna be there"
        map.addAnnotation(annotation)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //1.纬度精度 ->坐标
        //2.XY方向 ->放大比例
        let latitude:CLLocationDegrees = 48.858547
        let longitude:CLLocationDegrees = 2.294524
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let xScale:CLLocationDegrees = 0.01
        let yScale:CLLocationDegrees = 0.01
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: yScale, longitudeDelta: xScale)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
//        map.mapType = .satellite
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


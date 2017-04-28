//
//  MapViewController.swift
//  Pikamon Go!
//
//  Created by student0 on 4/28/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{
    @IBOutlet weak var mapViewBoard: MKMapView!
    
    //42.108516, -88.001374 : 42.073481, -87.937314
    
    func createLocation() -> CLLocationCoordinate2D
    {
        
        var x = CGFloat(42073481)
        var y = CGFloat(87937314)
        let rand_x = CGFloat(arc4random_uniform(35035))
        let rand_y = CGFloat(arc4random_uniform(64060))
        x = x + rand_x
        y = y + rand_y
        x = x / 100000
        let xCoordinate = CLLocationDegrees(x)
        let yCoordinate = CLLocationDegrees(y)
        
        let location = CLLocationCoordinate2D(latitude: xCoordinate, longitude: yCoordinate)
        
        
        return location
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pin = MKPointAnnotation()
        pin.coordinate = createLocation()
        
        mapViewBoard.addAnnotation(pin)
    }
}

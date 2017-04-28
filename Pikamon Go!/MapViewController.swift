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
    //42.108516, -88.001374 : 42.073481, -87.937314
    
    func createLocation() -> CLLocationCoordinate2D
    {
        
        let location = CLLocationCoordinate2D()
        
        return location
    }
}

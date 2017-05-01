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

//Get a key for value in Dictionary

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.0
    }
}


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{
    
    
    @IBOutlet weak var mapViewBoard: MKMapView!
    
    var annotationLocations = [Int:CLLocationCoordinate2D]()
    var annotationDistances = [Int: [Int: Double]]()
    
    //Game boundary coordinates: 42.108516, -88.001374 : 42.073481, -87.937314
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapViewBoard.delegate = self
        mapViewBoard.showsPointsOfInterest = true
        mapViewBoard.showsBuildings = true
        addAnnotations()
        sortAnnotations()
        createPolyline()
        zoomIn()
 
    }
    
    
    //Create random locations within boundary
    
    func createLocation() -> CLLocationCoordinate2D
    {
        
        var x = CGFloat(42073481)
        var y = CGFloat(87937314)
        let rand_x = CGFloat(arc4random_uniform(35035))
        let rand_y = CGFloat(arc4random_uniform(64060))
        x = x + rand_x; x = x / 1000000
        y = y + rand_y; y = -y / 1000000
        let xCoordinate = CLLocationDegrees(x)
        let yCoordinate = CLLocationDegrees(y)
        
        let location = CLLocationCoordinate2D(latitude: xCoordinate, longitude: yCoordinate)
        
        return location
    }
    
    //Initial Zoom
    
    func zoomIn()
    {
        let location = CLLocationCoordinate2D(latitude: 42.095498, longitude: -87.969344)
        let span = MKCoordinateSpanMake(0.07, 0.07)
        let region = MKCoordinateRegion(center: location, span: span)
        mapViewBoard.setRegion(region, animated: false)

    }
    
    //Add overlay on map in order to create game boundaries
    
    func createPolyline() {
        let point1 = CLLocationCoordinate2DMake(42.108516, -88.001374);
        let point2 = CLLocationCoordinate2DMake(42.108516, -87.937314);
        let point3 = CLLocationCoordinate2DMake(42.073481, -87.937314);
        let point4 = CLLocationCoordinate2DMake(42.073481, -88.001374);
        
        let points: [CLLocationCoordinate2D]
        points = [point1, point2, point3, point4, point1]
        
        let geodesic = MKGeodesicPolyline(coordinates: points, count: 5)
        mapViewBoard.add(geodesic)
    
    }
    
    //Color in the boundary overlay
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
       
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 2
            return polylineRenderer
    }
    
    //Add annotations to Map View
    
    func addAnnotations()
    {
        
        for i in 1...500
        {
            let pin = Annotation(title: String(i), tag: i, coordinate: createLocation())
            let location = CLLocationCoordinate2D.init(latitude: pin.coordinate.latitude, longitude: pin.coordinate.longitude)
            annotationLocations[i] = location
            mapViewBoard.addAnnotation(pin)
        }
    }
    
    //Create a sorted dictionary of the distance from User (in meters)
    
    func sortAnnotations()
    {
        
        let userLocation = CLLocation.init(latitude: mapViewBoard.userLocation.coordinate.latitude, longitude: mapViewBoard.userLocation.coordinate.longitude)
        
        //let userLocation = CLLocation.init(latitude: 42.108516, longitude: -88.001374)
        
        //Get raw distance
        
        var annotationDistanceDictionary = [Int:Double]()

        
        for (tag, annotationLocation) in annotationLocations
        {
            annotationDistanceDictionary[tag] = CLLocation.init(latitude: annotationLocation.latitude, longitude: annotationLocation.longitude).distance(from: userLocation)
        }
        
        //Sort distance
        
        let sortedDistance = Array(annotationDistanceDictionary.values).sorted(by: <)
        
        var annotationTagArray = [Int]()
        
        for distance in sortedDistance
        {
            
            if let key = annotationDistanceDictionary.someKey(forValue: distance)
            {
                annotationTagArray.append(key)
            }
        }
        var i = 1
        
        //Append sorted distance into dictionary
        
        for annotationTag in annotationTagArray
        {
            for (key, value) in annotationDistanceDictionary
            {
                if key == annotationTag
                {
                    annotationDistances[i] = [key:value]
                    print(i,key,value)
                    i += 1
                }
            }
        }

    }
        
}

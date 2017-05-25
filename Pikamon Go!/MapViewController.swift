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

extension UIImage {
    
    func resizeImage(targetSize: CGSize) -> UIImage? {
        let size = self.size
        if size.height != 0
        {
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        }
        else {return nil}
    }
}


class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIPopoverPresentationControllerDelegate
{
    
    var pikamonEnemiesClass = PikamonEnemies2()
    var pikamonClass = pikamonEnemiesList()
    
    @IBOutlet weak var mapViewBoard: MKMapView!
    
    @IBOutlet var gestureRecognizer: UIPanGestureRecognizer!
    var annotations = [Annotation]()
    var currentAnnotations = [Annotation]()
    var annotationLocations = [Int:CLLocationCoordinate2D]()
    var annotationDistances = [Int: [Int: Double]]()
    var timer = Timer()
    var locationMenager = CLLocationManager()
    var selectedPikamon = Parameters()
    var run = Int()
    //Game boundary coordinates: 42.108516, -88.001374 : 42.073481, -87.937314
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapViewBoard.delegate = self
        mapViewBoard.showsPointsOfInterest = true
        mapViewBoard.showsBuildings = true
        createAnnotations()
        sortAnnotations()
        createPolyline()
        zoomIn()
        locationMenager.delegate = self
        locationMenager.requestWhenInUseAuthorization()
        mapViewBoard.showsUserLocation = true
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.updateAnnotations), userInfo: nil, repeats: true)
        run = 0
        
    }
    
    func showPopover(_ base: UIView)
    {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Menu")
        {
        
            let navController = UINavigationController(rootViewController: viewController)
            
            navController.modalPresentationStyle = .popover
            
            if let pctrl = navController.popoverPresentationController {
                
                pctrl.delegate = self
                
                pctrl.sourceView = base
                
                pctrl.sourceRect = base.bounds
                
                self.present(navController, animated: true, completion: nil)
                
            }
        }
    }
    
    
    @IBAction func tapMenuButton(_ sender: UIButton) {
        
        showPopover(sender)
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
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
    
    //Focus map if user is not interacting
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        if gestureRecognizer.numberOfTouches == 0 //&& Int((manager.location?.speed)!) > 2
        {
            zoomIn()
        }

    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation)
    {
        if gestureRecognizer.numberOfTouches == 0 //&& Int((manager.location?.speed)!) > 2
        {
            zoomIn()
        }
    }
    
    
    //Update annotations on map
    
    func updateAnnotations()
    {
        var workingAnnotations = [Annotation]()
        var annotationsToAdd = [Annotation]()
        var annotationsToRemove = [Annotation]()
        var annotationsToKeep = [Annotation]()
        
        
        let userLocation = CLLocation.init(latitude: mapViewBoard.userLocation.coordinate.latitude, longitude: mapViewBoard.userLocation.coordinate.longitude)
        
        for a in annotations
        {
            let distance = CLLocation.init(latitude: a.coordinate.latitude, longitude: a.coordinate.longitude).distance(from: userLocation)
            
            if distance.isLess(than: 250)
            {
                workingAnnotations.append(a)
            }
        }
        if run == 0
        {
            currentAnnotations = workingAnnotations
            annotationsToAdd = workingAnnotations
            run = 1
        }
        else
        {
        for a in workingAnnotations
        {
            if currentAnnotations.contains(a)
            {
                annotationsToKeep.append(a)
            }
        }
        for i in currentAnnotations
        {
            if workingAnnotations.contains(i) == false
            {
                annotationsToRemove.append(i)
            }
        }
        
        for a in workingAnnotations
        {
            if currentAnnotations.contains(a) == false && annotationsToRemove.contains(a) == false
            {
                annotationsToAdd.append(a)
            }
        }
        }
        mapViewBoard.addAnnotations(annotationsToAdd)
        mapViewBoard.removeAnnotations(annotationsToRemove)
        currentAnnotations = annotationsToKeep + annotationsToAdd
        
    }
    
    //Assign pikamon based on weight
    
    func assign() -> Parameters
    {
        var weight = [Double]()
        
        for pika in pikamon.pikamonList
        {
            weight.append(pika.weight)
            
        }
        
        func randomNumber(probabilities: [Double]) -> Int
        {
    
            let sum = probabilities.reduce(0, +)
            let rnd = sum * Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)
            var accum = 0.0
            for (i, p) in probabilities.enumerated() {
                accum += p
                if rnd < accum {
                    return i
                }
            }
            return (probabilities.count - 1)
        }
        
        return(pikamon.pikamonList[randomNumber(probabilities: weight)])

    }
    
    //Initial Zoom
    
    func zoomIn()
    {
        let location = CLLocationCoordinate2D(latitude: mapViewBoard.userLocation.coordinate.latitude, longitude: mapViewBoard.userLocation.coordinate.longitude)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        mapViewBoard.setRegion(region, animated: true)

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
    
    //Add annotations to array
    
    func createAnnotations()
    {
        
        for i in 1...500
        {
            let pik = assign()
            let pin = Annotation(title: pik.name, tag: i, coordinate: createLocation(), pikamon: pik, image: pik.image)
            let location = CLLocationCoordinate2D.init(latitude: pin.coordinate.latitude, longitude: pin.coordinate.longitude)
            annotationLocations[i] = location
            
            annotations.append(pin)
            
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
    
    //Annotation Selected
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
    {
        
        if view.annotation?.coordinate.latitude != mapViewBoard.userLocation.coordinate.latitude && view.annotation?.coordinate.longitude != mapViewBoard.userLocation.coordinate.longitude
        {
        let d = view.annotation?.coordinate
        
        for a in annotations
        {
            if a.coordinate.latitude == d?.latitude && a.coordinate.longitude == d?.longitude
            {
                selectedPikamon = a.AnPikamon
                print(selectedPikamon.name)
            }
        }
        
        let alert8 = UIAlertController(title: "Are you sure that you want to battle \(selectedPikamon.name)?", message: "", preferredStyle: .alert)
        
        alert8.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (alert) in
            
            self.performSegue(withIdentifier: "toBattle", sender: nil)
            
        }))
        
        alert8.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        present(alert8, animated: true, completion: nil)
        }
    }
    
    //Change pins to images
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var pinImage = UIImage()
        
        if annotation.isEqual(mapView.userLocation)
        {
            let pin = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
            
            pin.image = UIImage(named: "playerImage")?.resizeImage(targetSize: CGSize(width: 60, height: 60))
        
            return pin
        }
        
        let pin = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        if currentAnnotations != []
        {
        for p in currentAnnotations
        {
            if p.title! == annotation.title!!
            {
                if p.image.size.width != 0
                {
                pinImage = p.image
                }
                break
            }
        }
        
        if pin.image?.size.height != 0
        {
        if let newi = pinImage.resizeImage(targetSize: CGSize(width: 50, height: 50))
        {
        pin.image = newi
        }
        }
        }
        
        return pin
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print(segue.identifier!)
        print(playerHealth.pikamonHealther[0].health)
        print(player.pikamonInInventory[0].health)
        
        if segue.identifier == "battleSegue" && playerHealth.pikamonHealther[0].health == player.pikamonInInventory[0].health
        {
            let pikamonTrasnfer = pikamonClass
            let pikamonEnemiesTransfer = pikamonEnemiesClass
            let newVC = segue.destination as! BattleViewController
            newVC.currentEnemtClass2 = pikamonEnemiesTransfer
            newVC.currentEnemy = pikamonTrasnfer
        }
        else if segue.identifier == "battleSegue" && playerHealth.pikamonHealther[0].health != player.pikamonInInventory[0].health
        {
            let sheet = UIAlertController(title: "Your pikamon needs to heal before battle.", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            sheet.popoverPresentationController?.sourceView = self.view
            sheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
            
            let cancelButton = UIAlertAction(title: "Continue", style: .default) { (action) -> Void in
                
            }
            
            sheet.addAction(cancelButton)
            
            self.present(sheet, animated: true, completion: nil)
        }
        
    }
    
        
}

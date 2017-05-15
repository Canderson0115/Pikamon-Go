//
//  AnnotationClass.swift
//  Pikamon Go!
//
//  Created by Oskar Lukacz on 4/30/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation
import MapKit

//Custom annotation class with tag attribute

class Annotation: NSObject, MKAnnotation {
    
    let title: String?
    let tag: Int
    let coordinate: CLLocationCoordinate2D
    let AnPikamon: Parameters
    var image = UIImage()
    
    init(title: String, tag: Int, coordinate: CLLocationCoordinate2D, pikamon: Parameters, image: UIImage) {
        self.title = title
        self.tag = tag
        self.coordinate = coordinate
        self.AnPikamon = pikamon
        self.image = image
        
        super.init()
    }
    
    var getTitle: String {
        return title!
    }
    
    
    var getTag: Int {
        return tag
    }
    
    var getPikamon: Parameters {
        return AnPikamon
    }
}


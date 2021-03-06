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
    
    init(title: String, tag: Int, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.tag = tag
        self.coordinate = coordinate
        
        super.init()
    }
    
    var getTitle: String {
        return title!
    }
    
    
    var getTag: Int {
        return tag
    }
}


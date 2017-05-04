//
//  TypeParameters.swift
//  Pikamon Go!
//
//  Created by student8 on 5/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class TypeParameters
{
    var classIdentifier = Int()
    var moveSet = [MoveParameters]()
    
    init(classId: Int, moveSet: [MoveParameters])
    {
        
        self.classIdentifier = classId
        self.moveSet = moveSet
        
    }
    
}

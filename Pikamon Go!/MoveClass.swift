//
//  MoveParameters.swift
//  Pikamon Go!
//
//  Created by student8 on 5/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class MoveClass
{
    
    let punch = MoveParameters(name: "punch", damage: 40, powerPoints: [20,20], damageMultiplier: 1.0)
    
    let flameTosser = MoveParameters(name: "Flametosser", damage: 60, powerPoints: [5, 5], damageMultiplier: 1.0)
    
    let lightningBolt = MoveParameters(name: "Lightningbolt", damage: 55, powerPoints: [15, 15], damageMultiplier: 1.0)
    
}

var moves = MoveClass()

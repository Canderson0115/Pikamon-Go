//
//  MoveParameters.swift
//  Pikamon Go!
//
//  Created by student8 on 5/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class MoveParameters
{
    var name = String()
    var damage = Int()
    var powerPoints = [Int]()
    var damageMultiplier = Double()
    var type = String()
    var restore = Int()
    
    init(name: String, damage: Int, powerPoints: [Int], damageMultiplier: Double, restore: Int)
    {
        self.name = name
        self.damage = damage
        self.powerPoints = powerPoints
        self.damageMultiplier = damageMultiplier
        self.restore = restore
    }
    
}

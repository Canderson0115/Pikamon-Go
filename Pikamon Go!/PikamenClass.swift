//
//  PikamenClass.swift
//  Pikamon Go!
//
//  Created by student0 on 4/28/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation
import MapKit

//Parameters for Pikamon

class Parameters
{
    var name = String()
    var type = [TypeParameters]()
    var health = Int()
    var alive = Bool()
    var moveSet = [MoveParameters]()
    var effects = [String]()
    var weight = Double()
    
    init(name: String, type: [TypeParameters], health: Int, alive: Bool, moveSet: [MoveParameters], effects: [String], weight: Double)
    {
        self.name = name
        self.type = type
        self.health = health
        self.alive = alive
        self.moveSet = moveSet
        self.effects = effects
        self.weight = weight
        
    }
    
}

//Class of all Pikamon

class Pikamon
{

    //var examplePikamon = Parameters(name: "Example", type: , health: 10, alive: true, moveSet: [], effects: ["ExampleEffect"], weight: 0.5)
}

//Class of all Types

class TypeParameters
{
    var classIdentifier = Int()
    var moveSet = [Moves]()
    
    init(classId: Int, moveSet: [Moves])
    {
        
        self.classIdentifier = classId
        self.moveSet = moveSet
        
    }
    
}

class Types
{
    let exampleType = TypeParameters(classId: 0, moveSet: [])
    
}

class MoveParameters
{
    var name = String()
    var damage = Int()
    var powerPoints = [Int]()
    var damageMultiplier = Double()
    
    init(name: String, damage: Int, powerPoints: [Int], damageMultiplier: Double)
    {
        self.name = name
        self.damage = damage
        self.powerPoints = powerPoints
        self.damageMultiplier = damageMultiplier
    }
    
}
class Moves
{
    let exampleMove = MoveParameters(name: "Example Name", damage: 10, powerPoints: [4,4], damageMultiplier: 1.0)
    
}





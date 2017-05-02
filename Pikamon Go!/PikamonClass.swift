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
    var type = String()
    var health = Int()
    var alive = Bool()
    var moveSet = [String]()
    var effects = [String]()
    var weight = Double()
    
    init(name: String, type: String, health: Int, alive: Bool, moveSet: [String], effects: [String], weight: Double)
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
    var examplePikamon = Parameters(name: "Example", type: "ExampleType", health: 10, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.5)

    var pokéchew = Parameters(name: "Pokéchew", type: "Electro", health: 30, alive: true, moveSet: ["ExampleLightningMove"], effects: [""], weight: 0.01)
    
    var tatarat = Parameters(name: "Tatarat", type: "Normal", health: 30, alive: true, moveSet: ["ExampleNormalMove"], effects: [""], weight: 0.5)
    
}

class Player
{
    
    var name = ""
    
    var level = 1
    
    var pikamonInInventory: [Pikamon] = []
    
}



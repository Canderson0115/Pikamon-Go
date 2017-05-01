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
    var examplePikamon = Parameters(name: "Example", type: "ExampleType", health: 10, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.0)
    
    var LizieChu = Parameters(name: "LizieChu", type: "Grass-Electro", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.25)
    
    var Glacierite = Parameters(name: "Glacierite", type: "Ice-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.25)
    
    var Bochtite = Parameters(name: "Bochtite", type: "Ice-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.075)
    
    var ChardGuard = Parameters(name: "Chard Guard", type: "Fire-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.1)
   
    var ThunderStrike = Parameters(name: "Thunder Strike", type: "Electro-Fire", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.15)
    
    var Buzzfeed = Parameters(name: "Buzzfeed", type: "Electro-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.15)
    
    var Trithyta = Parameters(name: "Trithyta", type: "Matter-Electro", health: 500, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.025)

}





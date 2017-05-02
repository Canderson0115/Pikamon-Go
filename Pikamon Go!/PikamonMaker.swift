//
//  PikamonMaker.swift
//  Pikamon Go!
//
//  Created by student8 on 5/2/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation

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

class Pikamon
{
    
    var LizieChu = Parameters(name: "LizieChu", type: "Grass-Electro", health: 250, alive: true, moveSet: ["Slash","Leaf Blast","Summon Spark","Flower Bloom"], effects: [""], weight: 0.2)
    
    var Glacierite = Parameters(name: "Glacierite", type: "Ice-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.2)
    
    var Bochtite = Parameters(name: "Bochtite", type: "Ice-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.2)
    
    var Trithyta = Parameters(name: "Trithyta", type: "Matter-Electro", health: 500, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.2)
    
    var pokéchew = Parameters(name: "Pokéchew", type: "Electro", health: 100, alive: true, moveSet: ["ExampleLightningMove"], effects: [""], weight: 0.2)
    
}

class Player
{
  
    var name = ""
    
    var level = 1
    
    var pikamonInParty:[Pikamon] = []
    
}









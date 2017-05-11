//
//  PikamonMaker.swift
//  Pikamon Go!
//
//  Created by student8 on 5/2/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import Foundation

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
    var image = UIImage()

    
    init()
    {
        
    }
    
    init(name: String, type: [TypeParameters], health: Int, alive: Bool, moveSet: [MoveParameters], effects: [String], weight: Double, image: UIImage)
    {
        self.name = name
        self.type = type
        self.health = health
        self.alive = alive
        self.moveSet = moveSet
        self.effects = effects
        self.weight = weight
        self.image = image
        
    }
    
    
    
}


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


class MoveParameters
{
    var name = String()
    var damage = Int()
    var powerPoints = [Int]()
    var damageMultiplier = Double()
    var type = String()
    
    init(name: String, damage: Int, powerPoints: [Int], damageMultiplier: Double)
    {
        self.name = name
        self.damage = damage
        self.powerPoints = powerPoints
        self.damageMultiplier = damageMultiplier
    }
    
}


//All Moves


class MoveClass
{
    
    let punch = MoveParameters(name: "punch", damage: 40, powerPoints: [20,20], damageMultiplier: 1.0)
    
    let flameTosser = MoveParameters(name: "Flametosser", damage: 60, powerPoints: [5, 5], damageMultiplier: 1.0)
    
    let lightningBolt = MoveParameters(name: "Lightningbolt", damage: 55, powerPoints: [15, 15], damageMultiplier: 1.0)
    
    let waterSquirt = MoveParameters(name: "Water Squirt", damage: 40, powerPoints: [20, 20], damageMultiplier: 1.0)
    
    let soakUp = MoveParameters(name: "Soak Up", damage: 40, powerPoints: [20, 20], damageMultiplier: 1.0)
    
}

var moves = MoveClass()

//All Types


class TypesClass
{
    
    let normal = TypeParameters(classId: 0, moveSet: [moves.punch])
    
    let fire = TypeParameters(classId: 1, moveSet: [moves.flameTosser, moves.punch])
    
    let water = TypeParameters(classId: 2, moveSet: [moves.punch, moves.waterSquirt])
    
    let electro = TypeParameters(classId: 3, moveSet: [moves.punch, moves.lightningBolt])
    
    let grass = TypeParameters(classId: 4, moveSet: [moves.punch, moves.soakUp])
}

var types = TypesClass()

//All Pikamon

class PikamonClass
{
    
    var LizieChu = Parameters(name: "Tatarat", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "lizzichuImage")!)
    
    var Glacierite = Parameters(name: "Glacierite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "whiteness")!)
    
    var Bochtite = Parameters(name: "Bochtite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "whiteness")!)
    
    var Trithyta = Parameters(name: "Trithyta", type: [types.normal], health: 500, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "whiteness")!)
    
    var Pokéchew = Parameters(name: "Pokéchew", type: [types.normal], health: 100, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "pokechewimage")!)
    
    var Firemander = Parameters(name: "Firemander", type: [types.fire], health: 25, alive: true, moveSet: [moves.punch, moves.flameTosser], effects: [""], weight: 0.01, image: UIImage(named: "firemanderimage")!)
    
    var Lonelysore = Parameters(name: "Lonelysore", type: [types.normal], health: 30, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.01, image: UIImage(named: "lonlisoreimage")!)
    
    var purple = Parameters(name: "Purple", type: [types.water], health: 28, alive: true, moveSet: [moves.punch, moves.waterSquirt], effects: [""], weight: 0.01, image: UIImage(named: "whiteness")!)
    
    var pikamonList = [Parameters]()
    
    init()
    {
        pikamonList = [Pokéchew, LizieChu, Glacierite, Bochtite, Trithyta, Firemander]
    }
}
    
var pikamon = PikamonClass()










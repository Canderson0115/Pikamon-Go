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


//All Moves


class MoveClass
{
    
    let punch = MoveParameters(name: "punch", damage: 40, powerPoints: [20,20], damageMultiplier: 1.0, restore: 0)
    
    let flameTosser = MoveParameters(name: "Flametosser", damage: 60, powerPoints: [5, 5], damageMultiplier: 1.0, restore: 0)
    
    let lightningBolt = MoveParameters(name: "Lightningbolt", damage: 55, powerPoints: [15, 15], damageMultiplier: 1.0, restore: 0)
    
    let waterSquirt = MoveParameters(name: "Water Squirt", damage: 40, powerPoints: [20, 20], damageMultiplier: 1.0, restore: 0)
    
    let soakUp = MoveParameters(name: "Soak Up", damage: 40, powerPoints: [20, 20], damageMultiplier: 1.0, restore: 0)
    
    let flowerBloom = MoveParameters(name: "Flower Bloom", damage: 15, powerPoints: [10, 10], damageMultiplier: 1.0, restore: 35)
    
    let summonSpark = MoveParameters(name: "Summon Spark", damage: 30, powerPoints: [10, 10], damageMultiplier: 1.0, restore: 0)
    
    let cherryBlossom = MoveParameters(name: "Cherry Blossom", damage: 45, powerPoints: [10, 10], damageMultiplier: 1.0, restore: 0)
    
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

struct PikamonClass
{
    
    var LizieChu = Parameters(name: "Tatarat", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch, moves.flowerBloom, moves.summonSpark, moves.cherryBlossom], effects: [""], weight: 0.2, image: UIImage(named: "tataratimage")!)
    
    var Glacierite = Parameters(name: "Glacierite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "glacieriteimage")!)
    
    var Bochtite = Parameters(name: "Bochtite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "bochtiteimage")!)
    
    var Trithyta = Parameters(name: "Trithyta", type: [types.normal], health: 500, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "whiteness")!)
    
    var Pokéchew = Parameters(name: "Pokéchew", type: [types.normal], health: 100, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "pokechewimage")!)
    
    var Firemander = Parameters(name: "Firemander", type: [types.fire], health: 25, alive: true, moveSet: [moves.punch, moves.flameTosser], effects: [""], weight: 0.01, image: UIImage(named: "firemanderimage")!)
    
    var Lonelysore = Parameters(name: "Lonelysore", type: [types.normal], health: 30, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.01, image: UIImage(named: "lonelysoreimage")!)
    
    var purple = Parameters(name: "Purple", type: [types.water], health: 28, alive: true, moveSet: [moves.punch, moves.waterSquirt], effects: [""], weight: 0.01, image: UIImage(named: "purpleimage")!)
    
    var pikamonList = [Parameters]()
    
    init()
    {
        pikamonList = [Pokéchew, LizieChu, Glacierite, Bochtite, Trithyta, Firemander]
    }
}

struct PikamonClassPar2
{
    
    var LizieChu = Parameters(name: "Tatarat", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch, moves.flowerBloom, moves.summonSpark, moves.cherryBlossom], effects: [""], weight: 0.2, image: UIImage(named: "tataratimage")!)
    
    var Glacierite = Parameters(name: "Glacierite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "glacieriteimage")!)
    
    var Bochtite = Parameters(name: "Bochtite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "bochtiteimage")!)
    
    var Trithyta = Parameters(name: "Trithyta", type: [types.normal], health: 500, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "whiteness")!)
    
    var Pokéchew = Parameters(name: "Pokéchew", type: [types.normal], health: 100, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "pokechewimage")!)
    
    var Firemander = Parameters(name: "Firemander", type: [types.fire], health: 25, alive: true, moveSet: [moves.punch, moves.flameTosser], effects: [""], weight: 0.01, image: UIImage(named: "firemanderimage")!)
    
    var Lonelysore = Parameters(name: "Lonelysore", type: [types.normal], health: 30, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.01, image: UIImage(named: "lonelysoreimage")!)
    
    var purple = Parameters(name: "Purple", type: [types.water], health: 28, alive: true, moveSet: [moves.punch, moves.waterSquirt], effects: [""], weight: 0.01, image: UIImage(named: "purpleimage")!)
    
    var pikamonList = [Parameters]()
    
    
}

struct PikamonEnemies2
{
    
    var LizieChu = Parameters(name: "Tatarat", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch, moves.flowerBloom, moves.summonSpark, moves.cherryBlossom], effects: [""], weight: 0.2, image: UIImage(named: "tataratimage")!)
    
    var Glacierite = Parameters(name: "Glacierite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "glacieriteimage")!)
    
    var Bochtite = Parameters(name: "Bochtite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "bochtiteimage")!)
    
    var Trithyta = Parameters(name: "Trithyta", type: [types.normal], health: 500, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "whiteness")!)
    
    var Pokéchew = Parameters(name: "Pokéchew", type: [types.normal], health: 100, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "pokechewimage")!)
    
    var Firemander = Parameters(name: "Firemander", type: [types.fire], health: 25, alive: true, moveSet: [moves.punch, moves.flameTosser], effects: [""], weight: 0.01, image: UIImage(named: "firemanderimage")!)
    
    var Lonelysore = Parameters(name: "Lonelysore", type: [types.normal], health: 30, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.01, image: UIImage(named: "lonelysoreimage")!)
    
    var purple = Parameters(name: "Purple", type: [types.water], health: 28, alive: true, moveSet: [moves.punch, moves.waterSquirt], effects: [""], weight: 0.01, image: UIImage(named: "purpleimage")!)
    
    var pikamonList = [Parameters]()
    
}

struct PikamonEnemies17
{
    
    var LizieChu = Parameters(name: "Tatarat", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch, moves.flowerBloom, moves.summonSpark, moves.cherryBlossom], effects: [""], weight: 0.2, image: UIImage(named: "tataratimage")!)
    
    var Glacierite = Parameters(name: "Glacierite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "glacieriteimage")!)
    
    var Bochtite = Parameters(name: "Bochtite", type: [types.normal], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "bochtiteimage")!)
    
    var Trithyta = Parameters(name: "Trithyta", type: [types.normal], health: 500, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "whiteness")!)
    
    var Pokéchew = Parameters(name: "Pokéchew", type: [types.normal], health: 100, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2, image: UIImage(named: "pokechewimage")!)
    
    var Firemander = Parameters(name: "Firemander", type: [types.fire], health: 25, alive: true, moveSet: [moves.punch, moves.flameTosser], effects: [""], weight: 0.01, image: UIImage(named: "firemanderimage")!)
    
    var Lonelysore = Parameters(name: "Lonelysore", type: [types.normal], health: 30, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.01, image: UIImage(named: "lonelysoreimage")!)
    
    var purple = Parameters(name: "Purple", type: [types.water], health: 28, alive: true, moveSet: [moves.punch, moves.waterSquirt], effects: [""], weight: 0.01, image: UIImage(named: "purpleimage")!)
    
    var pikamonList = [Parameters]()
    
}


var pikamonEnemies = PikamonEnemies2()
var pikamonZEnemies = PikamonEnemies17()
var pikamon = PikamonClass()
var pikamonClass2 = PikamonClassPar2()


struct pikamonEnemiesList
{
    var pikamonEnemiesInInventory: [Parameters] = [pikamonEnemies.Pokéchew,pikamonEnemies.Bochtite,pikamonEnemies.Firemander,pikamonEnemies.Glacierite,pikamonEnemies.LizieChu,pikamonEnemies.Lonelysore,pikamonEnemies.Trithyta]
}

struct pikamonEnemiesListReset
{
    var pikamonEnemiesInInventoryReseter: [Parameters] = [pikamonZEnemies.Pokéchew,pikamonZEnemies.Bochtite,pikamonZEnemies.Firemander,pikamonZEnemies.Glacierite,pikamonZEnemies.LizieChu,pikamonZEnemies.Lonelysore,pikamonZEnemies.Trithyta]
}

class WonderParameters
{
    var value1 = Int()
    var value2 = Int()
    var value3 = Int()
    var value4 = Int()
    var value5 = Int()
    var value6 = Int()
    
    init()
    {
        
    }
    
    init(value1: Int, value2: Int, value3: Int, value4: Int, value5: Int, value6: Int)
    {
        self.value1 = value1
        self.value2 = value2
        self.value3 = value3
        self.value4 = value4
        self.value5 = value5
        self.value6 = value6
        
    }
}



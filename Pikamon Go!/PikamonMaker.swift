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
    
    let lightningBolt = MoveParameters(name: "Lightningbolt", damage: <#T##Int#>, powerPoints: <#T##[Int]#>, damageMultiplier: <#T##Double#>)
    
}

var moves = MoveClass()

//All Types


class TypesClass
{
    
    let exampleType = TypeParameters(classId: 0, moveSet: [moves.punch])
    
    let fire = TypeParameters(classId: 1, moveSet: [moves.flameTosser])
    
    let electro = TypeParameters(classId: 2, moveSet: [moves.punch])
    
}

var types = TypesClass()

//All Pikamon

class PikamonClass
{
    
    var pokéchu = Parameters(name: "LizieChu", type: [types.exampleType]/*"Grass-Electro"*/, health: 250, alive: true, moveSet: [moves.punch]/*["Slash","Leaf Blast","Summon Spark","Flower Bloom"]*/, effects: [""], weight: 0.2)
    
    var example2 = Parameters(name: "LizieChu", type: [types.exampleType]/*"Grass-Electro"*/, health: 251, alive: true, moveSet: [moves.punch]/*["Slash","Leaf Blast","Summon Spark","Flower Bloom"]*/, effects: [""], weight: 0.2)
    
    var example3 = Parameters(name: "LizieChu", type: [types.exampleType]/*"Grass-Electro"*/, health: 252, alive: true, moveSet: [moves.punch]/*["Slash","Leaf Blast","Summon Spark","Flower Bloom"]*/, effects: [""], weight: 0.2)
    
    var example4 = Parameters(name: "LizieChu", type: [types.exampleType]/*"Grass-Electro"*/, health: 253, alive: true, moveSet: [moves.punch]/*["Slash","Leaf Blast","Summon Spark","Flower Bloom"]*/, effects: [""], weight: 0.2)
    
    var example5 = Parameters(name: "LizieChu", type: [types.exampleType]/*"Grass-Electro"*/, health: 254, alive: true, moveSet: [moves.punch]/*["Slash","Leaf Blast","Summon Spark","Flower Bloom"]*/, effects: [""], weight: 0.2)
    
    var example6 = Parameters(name: "LizieChu", type: [types.exampleType]/*"Grass-Electro"*/, health: 255, alive: true, moveSet: [moves.punch]/*["Slash","Leaf Blast","Summon Spark","Flower Bloom"]*/, effects: [""], weight: 0.2)
    
    var exampleFirePikamon = Parameters(name: "Firemander", type: [types.fire], health: 25, alive: true, moveSet: [moves.flameTosser], effects: [""], weight: 0.01)
    
    var pikamonList = [Parameters]()
    
    init()
    {
        pikamonList = [pokéchu,example2,example3,example4,example5,example6, exampleFirePikamon]
    }
    
    //var LizieChu = Parameters(name: "LizieChu", type: "Grass-Electro", health: 250, alive: true, moveSet: ["Slash","Leaf Blast","Summon Spark","Flower Bloom"], effects: [""], weight: 0.2)
    
    //var Glacierite = Parameters(name: "Glacierite", type: "Ice-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.2)
    
    //var Bochtite = Parameters(name: "Bochtite", type: "Ice-Rock", health: 250, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.2)
    
    //var Trithyta = Parameters(name: "Trithyta", type: "Matter-Electro", health: 500, alive: true, moveSet: ["ExampleMove"], effects: ["ExampleEffect"], weight: 0.2)
    
    //var Pokéchew = Parameters(name: "Pokéchew", type: "Electro", health: 100, alive: true, moveSet: ["ExampleLightningMove"], effects: [""], weight: 0.2)
    
    /*func makeIterator() -> PikamonIterator
    {
        return PikamonIterator(self)
    }
    */
    
    /*func generate() -> AnyIterator<Any>{
        let nextIndex = pikamonList.count-1 // Construct a AnyGenerator instance, passing a closure that returns the next car in the iteration
        return AnyIterator { if (nextIndex < 0) { return nil }
        return self.pikamonList[nextIndex-1] } }
    
    func listPropertiesWithValues(reflect: Mirror? = nil) -> [String]
    {
        var returnArray  = [String]()
        let mirror = reflect ?? Mirror(reflecting: self)
        for (index, attr) in mirror.children.enumerated() {
            if let property_name = attr.label as String!
            {
            
                returnArray.append(" \(index):  \(property_name) ")
            }
        }
        return returnArray
    }
    
    func dfs()
    {
        for i in pikamon
    }
    
    */
    
    
}


/*struct PikamonIterator:IteratorProtocol
{
    var pikamon:PikamonClass  // you must know the group in question
    var pointer:Parameters?  // you must know where you are
    var i = 0
    
    init(_ pikamon:PikamonClass)
    {
        // so note those two items
        self.pikamon = pikamon
        self.pointer = pikamon.example1
    }
    
    mutating func next() -> Parameters?
    {
        // return the next one; careful to return nil at end
        if self.i != 5
        {
        print("oop")
        let thisOne = self.pointer
        self.pointer = self.next()
        self.i = self.i + 1
        return thisOne
        }
        else
        {
            return nil
        }

    }
}

*/

var pikamon = PikamonClass()










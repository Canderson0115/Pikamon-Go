//
//  Pikamon.swift
//  Pikamon Go!
//
//  Created by student8 on 5/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class PikamonClass
{
    
    var LizieChu = Parameters(name: "LizieChu", type: [types.exampleType], health: 250, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2)
    
    var Glacierite = Parameters(name: "Glacierite", type: [types.exampleType], health: 250, alive: true, moveSet: [moves.punch], effects: ["ExampleEffect"], weight: 0.2)
    
    var Bochtite = Parameters(name: "Bochtite", type: [types.exampleType], health: 250, alive: true, moveSet: [moves.punch], effects: ["ExampleEffect"], weight: 0.2)
    
    var Trithyta = Parameters(name: "Trithyta", type: [types.exampleType], health: 500, alive: true, moveSet: [moves.punch], effects: ["ExampleEffect"], weight: 0.2)
    
    var Pokéchew = Parameters(name: "Pokéchew", type: [types.exampleType], health: 100, alive: true, moveSet: [moves.punch], effects: [""], weight: 0.2)
    
    var exampleFirePikamon = Parameters(name: "Firemander", type: [types.fire], health: 25, alive: true, moveSet: [moves.flameTosser], effects: [""], weight: 0.01)
    
    var pikamonList = [Parameters]()
    
    init()
    {
        pikamonList = [Pokéchew, LizieChu, Glacierite, Bochtite, Trithyta]
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

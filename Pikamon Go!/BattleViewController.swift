//
//  BattleViewController.swift
//  Pikamon Go!
//
//  Created by student8 on 4/27/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {

    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyImageView: UIImageView!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamHealthLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    
    @IBOutlet weak var skill1Button: UIButton!
    @IBOutlet weak var skill2Button: UIButton!
    @IBOutlet weak var skill3Button: UIButton!
    @IBOutlet weak var skill4Button: UIButton!
    
    @IBOutlet weak var gameConsole: UILabel!
    
    var currentEnemy = PikamonEnemies()
    var currentEnemtClass2 = PikamonEnemies()
    
    var player = Player()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        teamNameLabel.text = "\(player.pikamonInInventory[0].name)"
        teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(player.pikamonInInventory[0].health)H"
        
        skill1Button.setTitle("\(player.pikamonInInventory[0].moveSet[0].name)", for: .normal)
  //      skill2Button.setTitle("\(player.pikamonInInventory[0].moveSet[1].name)", for: .normal)
  //      skill3Button.setTitle("\(player.pikamonInInventory[0].moveSet[2].name)", for: .normal)
  //      skill4Button.setTitle("\(player.pikamonInInventory[0].moveSet[3].name)", for: .normal)
        
        let randomPikamon = 1 + Int(arc4random_uniform(1))
        
        if randomPikamon == 2
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 1)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            
            let movedElementSec = currentEnemtClass2.pikamonEnemiesInInventory.remove(at: 1)
            currentEnemtClass2.pikamonEnemiesInInventory.insert(movedElementSec, at: 0)
            
            
        } else if randomPikamon == 3
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 2)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            
            let movedElementSec = currentEnemtClass2.pikamonEnemiesInInventory.remove(at: 2)
            currentEnemtClass2.pikamonEnemiesInInventory.insert(movedElementSec, at: 0)
            
            
        } else if randomPikamon == 4
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 3)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            
            let movedElementSec = currentEnemtClass2.pikamonEnemiesInInventory.remove(at: 3)
            currentEnemtClass2.pikamonEnemiesInInventory.insert(movedElementSec, at: 0)
            
            
        } else if randomPikamon == 5
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 4)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            
            let movedElementSec = currentEnemtClass2.pikamonEnemiesInInventory.remove(at: 4)
            currentEnemtClass2.pikamonEnemiesInInventory.insert(movedElementSec, at: 0)
            
            
        } else if randomPikamon == 6
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 5)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            
            let movedElementSec = currentEnemtClass2.pikamonEnemiesInInventory.remove(at: 5)
            currentEnemtClass2.pikamonEnemiesInInventory.insert(movedElementSec, at: 0)
            
        }
        
        enemyNameLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].name)"
        enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(currentEnemtClass2.pikamonEnemiesInInventory[0].health)H"
//        enemyImageView.image = currentEnemy.pikamonEnemiesInInventory[0].image
        gameConsole.text = "[Matt] \(currentEnemy.pikamonEnemiesInInventory[0].name) I release you!"
        
    }

    @IBAction func skill1Tapped(_ sender: UIButton)
    {
        let blockChance = 1 + Int(arc4random_uniform(10))
        
        if blockChance <= 2
        {
            gameConsole.text = "Enemy Pikamon blocked incoming damage"
        }
        else
        {
            if player.pikamonInInventory[0].moveSet[0].name == "punch"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[0].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(currentEnemtClass2.pikamonEnemiesInInventory[0].health)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[0].damage) damage"
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        currentEnemy = currentEnemtClass2
        
        let pikamonEnemiesTransfer = pikamonEnemies
        let newVC = segue.destination as! MapViewController
        newVC.pikamonEnemiesClass = pikamonEnemiesTransfer
        
        print("hi")
    }
    
}

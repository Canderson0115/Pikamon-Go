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
    
    var pikamonEnemies = PikamonEnemies()
    var pikamonEnemiesClass2 = PikamonEnemies()
    
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
        
        if randomPikamon == 1
        {
            enemyNameLabel.text = "\(pikamonEnemies.LizieChu.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.LizieChu.health)H / \(pikamonEnemies.LizieChu.health)H"
            enemyImageView.image = UIImage(named: "lizzichuImage")!
            gameConsole.text = "[Matt] Lizzichu I release you!"
            
            
        } else if randomPikamon == 2
        {
            enemyNameLabel.text = "\(pikamonEnemies.Glacierite.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Glacierite.health)H / \(pikamonEnemies.Glacierite.health)H"
            
            gameConsole.text = "[Matt] Glacierite I release you!"
            
            
        } else if randomPikamon == 3
        {
            enemyNameLabel.text = "\(pikamonEnemies.Bochtite.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Bochtite.health)H / \(pikamonEnemies.Bochtite.health)H"
            
            gameConsole.text = "[Matt] Bochtite I release you!"
            
            
        } else if randomPikamon == 4
        {
            enemyNameLabel.text = "\(pikamonEnemies.Trithyta.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Trithyta.health)H / \(pikamonEnemies.Trithyta.health)H"
            
            gameConsole.text = "[Matt] Trithyta I release you!"
            
            
        } else if randomPikamon == 5
        {
            enemyNameLabel.text = "\(pikamonEnemies.Pokéchew.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Pokéchew.health)H / \(pikamonEnemies.Pokéchew.health)H"
            enemyImageView.image = UIImage(named: "pokechewimage")!
            gameConsole.text = "[Matt] Pokéchew I release you!"
            
        }
        
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
                pikamonEnemies.LizieChu.health -= player.pikamonInInventory[0].moveSet[0].damage
/*              pikamonEnemies.Bochtite.health -= player.pikamonInInventory[0].moveSet[0].damage
                pikamonEnemies.Firemander.health -= player.pikamonInInventory[0].moveSet[0].damage
                pikamonEnemies.Glacierite.health -= player.pikamonInInventory[0].moveSet[0].damage
                pikamonEnemies.Lonelysore.health -= player.pikamonInInventory[0].moveSet[0].damage
                pikamonEnemies.Pokéchew.health -= player.pikamonInInventory[0].moveSet[0].damage
                pikamonEnemies.Trithyta.health -= player.pikamonInInventory[0].moveSet[0].damage
 */
                
                enemyHealthLabel.text = "\(pikamonEnemies.LizieChu.health)H / \(pikamonEnemiesClass2.LizieChu.health)H"
                gameConsole.text = " "
            }
        }
    }
    
}

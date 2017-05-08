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
    
    @IBOutlet weak var skillOneLabel: UILabel!
    @IBOutlet weak var skillTwoLabel: UILabel!
    @IBOutlet weak var skillThreeLabel: UILabel!
    @IBOutlet weak var skillFourLabel: UILabel!
    
    var pikamonEnemies = PikamonClass()
    //    var player = currentPikamon()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        //        teamNameLabel.text = "\(player.currentPikamonName)"
        //        teamHealthLabel.text = "\(player.currentPikamon.health)H / \(player.currentPikamon.health)H"
        
        
        let randomPikamon = 1 + Int(arc4random_uniform(5))
        
        if randomPikamon == 1
        {
            enemyNameLabel.text = "\(pikamonEnemies.LizieChu.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.LizieChu.health)H / \(pikamonEnemies.LizieChu.health)H"
            enemyImageView.image = UIImage(named: "lizzichuImage")!
            
        } else if randomPikamon == 2
        {
            enemyNameLabel.text = "\(pikamonEnemies.Glacierite.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Glacierite.health)H / \(pikamonEnemies.Glacierite.health)H"
            
            
        } else if randomPikamon == 3
        {
            enemyNameLabel.text = "\(pikamonEnemies.Bochtite.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Bochtite.health)H / \(pikamonEnemies.Bochtite.health)H"
            
            
        } else if randomPikamon == 4
        {
            enemyNameLabel.text = "\(pikamonEnemies.Trithyta.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Trithyta.health)H / \(pikamonEnemies.Trithyta.health)H"
            
            
        } else if randomPikamon == 5
        {
            enemyNameLabel.text = "\(pikamonEnemies.Pokéchew.name)"
            enemyHealthLabel.text = "\(pikamonEnemies.Pokéchew.health)H / \(pikamonEnemies.Pokéchew.health)H"
            enemyImageView.image = UIImage(named: "pokechewimage")!
            
        }
        
    }

}

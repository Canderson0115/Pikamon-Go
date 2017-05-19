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
    @IBOutlet weak var exitButton: UIButton!
    
    var currentEnemy = pikamonEnemiesList()
    var currentEnemy2 = pikamonEnemiesList()
    var pikamonReseter = pikamonEnemiesListReset()
    
    var currentEnemtClass2 = PikamonEnemies2()
    var currentEnemtClass3 = PikamonEnemies2()
    
    var player = Player()
    var playerHeal = playerHealer()
    
    var enemyHealth = 0
    var pikamonHealth = 0
    
    var timer = Timer()
    var countTimer = 0
    
    override func viewDidAppear(_ animated: Bool)
    {
        let sheet = UIAlertController(title: "", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        sheet.popoverPresentationController?.sourceView = self.view
        sheet.popoverPresentationController?.sourceRect = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 100)
        
        let attackButton = UIAlertAction(title: "Attack", style: .default) { (action) -> Void in
            
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .default) { action in (self.segueReturn())
            
        }
        
        sheet.addAction(attackButton)
        sheet.addAction(cancelButton)
        
        self.present(sheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        pikamonHealth = playerHeal.pikamonHealther[0].health
        
        exitButton.isEnabled = false
        exitButton.isHidden = true
        
        teamNameLabel.text = "\(player.pikamonInInventory[0].name)"
        teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(player.pikamonInInventory[0].health)H"
        
        skill1Button.setTitle("\(player.pikamonInInventory[0].moveSet[0].name)", for: .normal)
        skill2Button.setTitle("\(player.pikamonInInventory[0].moveSet[1].name)", for: .normal)
        skill3Button.setTitle("\(player.pikamonInInventory[0].moveSet[2].name)", for: .normal)
        skill4Button.setTitle("\(player.pikamonInInventory[0].moveSet[3].name)", for: .normal)
        
        let randomPikamon = 1 + Int(arc4random_uniform(7))
        
        if randomPikamon == 1
        {
            enemyHealth = 250
        }
        else if randomPikamon == 2
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 1)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            enemyHealth = 250
            
        }
        else if randomPikamon == 3
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 2)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            enemyHealth = 250
            
        }
        else if randomPikamon == 4
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 3)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            enemyHealth = 250
            
        }
        else if randomPikamon == 5
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 4)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            enemyHealth = 250
            
        }
        else if randomPikamon == 6
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 5)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            enemyHealth = 250
            
        }
        else if randomPikamon == 7
        {
            let movedElement = currentEnemy.pikamonEnemiesInInventory.remove(at: 6)
            currentEnemy.pikamonEnemiesInInventory.insert(movedElement, at: 0)
            enemyHealth = 500
            
        }
        
        enemyNameLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].name)"
        enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
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
            if player.pikamonInInventory[0].moveSet[0].name == "Punch"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[0].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[0].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[0].name == "Flower Bloom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[0].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                player.pikamonInInventory[0].health += player.pikamonInInventory[0].moveSet[0].restore
                teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(pikamonHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[0].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[0].name == "Summon Spark"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[0].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[0].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[0].name == "Cherry Blossom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[0].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[0].damage) damage"
            }
        }
        
        timerStart()
        winnerOrLoser()
    }
    
    @IBAction func skill2Tapped(_ sender: UIButton)
    {
        let blockChance = 1 + Int(arc4random_uniform(10))
        
        if blockChance <= 2
        {
            gameConsole.text = "Enemy Pikamon blocked incoming damage"
        }
        else
        {
            if player.pikamonInInventory[0].moveSet[1].name == "Punch"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[1].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[1].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[1].name == "Flower Bloom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[1].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                player.pikamonInInventory[0].health += player.pikamonInInventory[0].moveSet[1].restore
                teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(pikamonHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[1].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[1].name == "Summon Spark"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[1].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[1].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[1].name == "Cherry Blossom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[1].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[1].damage) damage"
            }
        }
        
        timerStart()
        winnerOrLoser()
    }
    
    @IBAction func skill3Tapped(_ sender: UIButton)
    {
        let blockChance = 1 + Int(arc4random_uniform(10))
        
        if blockChance <= 2
        {
            gameConsole.text = "Enemy Pikamon blocked incoming damage"
        }
        else
        {
            if player.pikamonInInventory[0].moveSet[2].name == "Punch"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[2].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[2].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[2].name == "Flower Bloom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[2].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                player.pikamonInInventory[0].health += player.pikamonInInventory[0].moveSet[2].restore
                teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(pikamonHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[2].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[2].name == "Summon Spark"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[2].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[2].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[2].name == "Cherry Blossom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[2].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[2].damage) damage"
            }
        }
        
        timerStart()
        winnerOrLoser()
    }
    
    @IBAction func skill4Tapped(_ sender: UIButton)
    {
        let blockChance = 1 + Int(arc4random_uniform(10))
        
        if blockChance <= 2
        {
            gameConsole.text = "Enemy Pikamon blocked incoming damage"
        }
        else
        {
            if player.pikamonInInventory[0].moveSet[3].name == "Punch"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[3].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[3].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[3].name == "Flower Bloom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[3].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                player.pikamonInInventory[0].health += player.pikamonInInventory[0].moveSet[3].restore
                teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(pikamonHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[3].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[3].name == "Summon Spark"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[3].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[3].damage) damage"
            }
            else if player.pikamonInInventory[0].moveSet[3].name == "Cherry Blossom"
            {
                currentEnemy.pikamonEnemiesInInventory[0].health -= player.pikamonInInventory[0].moveSet[3].damage
                enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
                
                gameConsole.text = "Enemy Pikamon takes \(player.pikamonInInventory[0].moveSet[3].damage) damage"
            }
        }
        
        timerStart()
        winnerOrLoser()
    }
    
    func winnerOrLoser()
    {
        if currentEnemy.pikamonEnemiesInInventory[0].health <= 0
        {
            gameConsole.text = "\(currentEnemy.pikamonEnemiesInInventory[0].name) has fainted"
            
            currentEnemy.pikamonEnemiesInInventory[0].health = 0
            enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
            
            skill1Button.isEnabled = false
            skill2Button.isEnabled = false
            skill3Button.isEnabled = false
            skill4Button.isEnabled = false
            exitButton.isEnabled = true
            exitButton.isHidden = false
            
            timer.invalidate()
        }
        else if player.pikamonInInventory[0].health <= 0
        {
            gameConsole.text = "\(player.pikamonInInventory[0].name) has fainted"
            
            player.pikamonInInventory[0].health = 0
            teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(pikamonHealth)H"
            
            skill1Button.isEnabled = false
            skill2Button.isEnabled = false
            skill3Button.isEnabled = false
            skill4Button.isEnabled = false
            exitButton.isEnabled = true
            exitButton.isHidden = false
        }
    }
    
    func enemyAttack()
    {
        skill1Button.isEnabled = false
        skill2Button.isEnabled = false
        skill3Button.isEnabled = false
        skill4Button.isEnabled = false
        
        if countTimer >= 4
        {
            let enemyRandomAttack = 1 + Int(arc4random_uniform(4))
            
            if enemyRandomAttack == 1
            {
                attacks()
            }
            else if enemyRandomAttack == 2
            {
                attacks()
            }
            else if enemyRandomAttack == 3
            {
                attacks()
            }
            else if enemyRandomAttack == 4
            {
                attacks()
            }
            
            timer.invalidate()
            countTimer = 0
            
            skill1Button.isEnabled = true
            skill2Button.isEnabled = true
            skill3Button.isEnabled = true
            skill4Button.isEnabled = true
            
            winnerOrLoser()
        }
        else
        {
            countTimer += 1
        }
        
    }
    
    func timerStart()
    {
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(enemyAttack), userInfo: nil, repeats: true)
    }
    
    func attacks()
    {
        
        let blockChance = 1 + Int(arc4random_uniform(10))
        
        if blockChance <= 2
        {
            gameConsole.text = "Your Pikamon blocked incoming damage"
        }
        else
        {
            player.pikamonInInventory[0].health -= currentEnemy.pikamonEnemiesInInventory[0].moveSet[0].damage
            teamHealthLabel.text = "\(player.pikamonInInventory[0].health)H / \(pikamonHealth)H"
            
            gameConsole.text = "Your Pikamon takes \(currentEnemy.pikamonEnemiesInInventory[0].moveSet[0].damage) damage"
            
            currentEnemy.pikamonEnemiesInInventory[0].health += currentEnemy.pikamonEnemiesInInventory[0].moveSet[0].restore
            enemyHealthLabel.text = "\(currentEnemy.pikamonEnemiesInInventory[0].health)H / \(enemyHealth)H"
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        currentEnemtClass2 = currentEnemtClass3
        currentEnemy.pikamonEnemiesInInventory = pikamonReseter.pikamonEnemiesInInventoryReseter
        
        let pikamonTransfer = currentEnemy
        let pikamonEnemiesTransfer = currentEnemtClass2
        let newVC = segue.destination as! MapViewController
        newVC.pikamonEnemiesClass = pikamonEnemiesTransfer
        newVC.pikamonClass = pikamonTransfer
        
    }
    
    func segueReturn()
    {
            self.performSegue(withIdentifier: "returnMap", sender: self)
    }
    
}




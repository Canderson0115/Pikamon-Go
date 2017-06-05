//
//  HospitalViewController.swift
//  Pikamon Go!
//
//  Created by student8 on 5/31/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class HospitalViewController: UIViewController {

    @IBOutlet weak var healPikamonOne: UILabel!
    @IBOutlet weak var healPikamonTwo: UILabel!
    @IBOutlet weak var healPikamonThree: UILabel!
    @IBOutlet weak var healPikamonFour: UILabel!
    @IBOutlet weak var healPikamonFive: UILabel!
    
    @IBOutlet weak var addHealOne: UIButton!
    @IBOutlet weak var addHealTwo: UIButton!
    @IBOutlet weak var addHealThree: UIButton!
    @IBOutlet weak var addHealFour: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    var timer = Timer()
    var healCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.cyan
        
        addHealOne.isEnabled = false
        addHealTwo.isEnabled = false
        addHealThree.isEnabled = false
        addHealFour.isEnabled = false
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(healRelay), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func onBackTap(_ sender: UIButton)
    {
        timer.invalidate()
    }

    @IBAction func addPikamonOne(_ sender: UIButton)
    {
        healCount += 1
        
        let playerHealthOne = playerHealth.pikamonHealther[0].health
        
        healPikamonOne.text = "\(player.pikamonInInventory[0].name): \(player.pikamonInInventory[0].health)H/\(playerHealthOne)H"
        
//        addHealOne.isEnabled = true
        backButton.isEnabled = false
        backButton.isHidden = true
        
    }
    
    @IBAction func addPikamonTwo(_ sender: UIButton)
    {
        healCount += 1
        
        let playerHealthOne = playerHealth.pikamonHealther[1].health
        
        healPikamonOne.text = "\(player.pikamonInInventory[1].name): \(player.pikamonInInventory[1].health)H/\(playerHealthOne)H"
        
        addHealTwo.isEnabled = true
        backButton.isEnabled = false
        backButton.isHidden = true
    }
    
    @IBAction func addPikamonThree(_ sender: UIButton)
    {
        healCount += 1
        
        let playerHealthOne = playerHealth.pikamonHealther[2].health
        
        healPikamonOne.text = "\(player.pikamonInInventory[2].name): \(player.pikamonInInventory[2].health)H/\(playerHealthOne)H"
        
        addHealThree.isEnabled = true
        backButton.isEnabled = false
        backButton.isHidden = true
    }
    
    @IBAction func addPikamonFour(_ sender: UIButton)
    {
        healCount += 1
        
        let playerHealthOne = playerHealth.pikamonHealther[3].health
        
        healPikamonOne.text = "\(player.pikamonInInventory[3].name): \(player.pikamonInInventory[3].health)H/\(playerHealthOne)H"
        
        addHealFour.isEnabled = true
        backButton.isEnabled = false
        backButton.isHidden = true
    }
    
    @IBAction func addPikamonFive(_ sender: UIButton)
    {
        healCount += 1
        
        let playerHealthOne = playerHealth.pikamonHealther[4].health
        
        healPikamonOne.text = "\(player.pikamonInInventory[4].name): \(player.pikamonInInventory[4].health)H/\(playerHealthOne)H"
        
        backButton.isEnabled = false
        backButton.isHidden = true
    }
    
    func healRelay()
    {
        if healPikamonOne.text != "" && player.pikamonInInventory[0].health < playerHealth.pikamonHealther[0].health
        {
            player.pikamonInInventory[0].health += 1
            
            let playerHealthOne = playerHealth.pikamonHealther[0].health
            healPikamonOne.text = "\(player.pikamonInInventory[0].name): \(player.pikamonInInventory[0].health)H/\(playerHealthOne)H"
        }
        else if healPikamonTwo.text != "" && player.pikamonInInventory[1].health < playerHealth.pikamonHealther[1].health
        {
            player.pikamonInInventory[1].health += 1
            
            let playerHealthTwo = playerHealth.pikamonHealther[1].health
            healPikamonTwo.text = "\(player.pikamonInInventory[1].name): \(player.pikamonInInventory[1].health)H/\(playerHealthTwo)H"
        }
        else if healPikamonThree.text != "" && player.pikamonInInventory[2].health < playerHealth.pikamonHealther[2].health
        {
            player.pikamonInInventory[2].health += 1
            
            let playerHealthThree = playerHealth.pikamonHealther[2].health
            healPikamonThree.text = "\(player.pikamonInInventory[2].name): \(player.pikamonInInventory[2].health)H/\(playerHealthThree)H"
        }
        else if healPikamonFour.text != "" && player.pikamonInInventory[3].health < playerHealth.pikamonHealther[3].health
        {
            player.pikamonInInventory[3].health += 1
            
            let playerHealthFour = playerHealth.pikamonHealther[3].health
            healPikamonFour.text = "\(player.pikamonInInventory[3].name): \(player.pikamonInInventory[0].health)H/\(playerHealthFour)H"
        }
        else if healPikamonFive.text != "" && player.pikamonInInventory[4].health < playerHealth.pikamonHealther[4].health
        {
            player.pikamonInInventory[4].health += 1
            
            let playerHealthFive = playerHealth.pikamonHealther[4].health
            healPikamonFive.text = "\(player.pikamonInInventory[4].name): \(player.pikamonInInventory[4].health)H/\(playerHealthFive)H"
        }
        
        if player.pikamonInInventory[0].health == playerHealth.pikamonHealther[0].health && healCount > 0
        {
            healCount -= 1
        }
//        else if player.pikamonInInventory[1].health == playerHealth.pikamonHealther[1].health && healCount > 0
//        {
//            healCount -= 1
//        }
//        else if player.pikamonInInventory[2].health == playerHealth.pikamonHealther[2].health && healCount > 0
//        {
//            healCount -= 1
//        }
//        else if player.pikamonInInventory[3].health == playerHealth.pikamonHealther[3].health && healCount > 0
//        {
//            healCount -= 1
//        }
//        else if player.pikamonInInventory[4].health == playerHealth.pikamonHealther[4].health && healCount > 0
//        {
//            healCount -= 1
//        }
        
        if healCount == 0
        {
            backButton.isEnabled = true
            backButton.isHidden = false
        }
    }
    
    
    
    
    
}

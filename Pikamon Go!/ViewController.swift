//
//  ViewController.swift
//  Pikamon Go!
//
//  Created by student8 on 4/26/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

var player = Player()

var playerHealth = playerHealer()

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var tapToContinueLabel: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    //Used to move dialogue on to the next sentence
    var numberOfTaps = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Welcome to the world of Pikamon Go!"
        
        tapToContinueLabel.setTitle("", for: .disabled)
        
        tapToContinueLabel.setTitle("Tap here to continue.", for: .normal)
        
        tapToContinueLabel.isEnabled = false
        
        imageView.image = UIImage(named: "professoracorn")
        
    }
    
    
    @IBAction func tapToContinue(_ sender: UITapGestureRecognizer) {
        
        //All of this stuff is opening dialogue.
        
        numberOfTaps += 1
        
        if numberOfTaps == 1
        {
            textLabel.text = "My name is Professor Acorn, but most people just call me the Pikamon Professor."
        }
        else if numberOfTaps == 2
        {
            textLabel.text = "You are about to enter the world of Poké-- I mean Pikamon."
        }
        else if numberOfTaps == 3
        {
            textLabel.adjustsFontForContentSizeCategory = true
            
            textLabel.text = "Pikamon are creatures that inhabit this world. They are used only for battle."
        }
        else if numberOfTaps == 4
        {
            textLabel.text = "Anyway, what's your name?"
        }
        else if numberOfTaps == 5
        {
            let alert = UIAlertController(title: "What's your name?", message: "", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: { (alertTextField) in
                
                alertTextField.placeholder = "Name"
                
                alertTextField.autocapitalizationType = UITextAutocapitalizationType.sentences
                
            })
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (response) in
                
                let nameAnswer = alert.textFields?[0].text!
                
                player.name = nameAnswer!
                
                if nameAnswer == "John Cena"
                {
                    self.textLabel.text = "AND HIS NAME IS JOHN CENA!!!"
                }
                else if nameAnswer == "Harambe"
                {
                    self.textLabel.text = "RIP"
                }
                else
                {
                    self.textLabel.text = "\(player.name), huh? That's a fine name."
                }
            }))
            
            present(alert, animated: true, completion: nil)
            
        }
        else if numberOfTaps == 6
        {
            textLabel.text = "Ok, now it's time for you to choose your first Poké-- that is, Pikamon."
        }
        else if numberOfTaps == 7
        {
            
            let alert3 = UIAlertController(title: "Who do you choose?", message: "", preferredStyle: .alert)
            
            alert3.addAction(UIAlertAction(title: "Firemander", style: .default, handler: { (response) in
                
                player.pikamonInInventory.append(pikamon.Firemander)
                
                playerHealth.pikamonHealther.append(pikamonClass2.Firemander)
                
                self.imageView.image = UIImage(named: "firemanderimage")
                
                self.textLabel.text = "Firemander, the fire type Pikamon. This is the one you want?"
                
            }))
            
            alert3.addAction(UIAlertAction(title: "Lonelysore", style: .default, handler: { (response) in
                
                player.pikamonInInventory.append(pikamon.Lonelysore)
                
                playerHealth.pikamonHealther.append(pikamonClass2.Lonelysore)
                
                self.imageView.image = UIImage(named: "lonelysoreimage")
                
                self.textLabel.text = "Lonelysore, the grass type Pikamon. Seriously? This is the one you want?"
                
            }))
            
            
            alert3.addAction(UIAlertAction(title: "Purple", style: .default, handler: { (response) in
                
                player.pikamonInInventory.append(pikamon.purple)
                
                playerHealth.pikamonHealther.append(pikamonClass2.purple)
                
                self.imageView.image = UIImage(named: "purpleimage")
                
                self.textLabel.text = "Purple, the water type Pikamon. This is the one you want?"
                
            }))
            
            present(alert3, animated: true, completion: nil)
            
        }
        else if numberOfTaps == 8
        {
            let alert4 = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .alert)
            
            alert4.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                
                if player.pikamonInInventory[0].name == "Lonelysore"
                {
                    self.textLabel.text = "*cough cough* Great choice *cough*."
                }
                else
                {
                    self.textLabel.text = "OK, then. You've decided on \(player.pikamonInInventory[0].name)."
                }
            }))
            
            alert4.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
                
                player.pikamonInInventory.removeAll()
                
                self.imageView.image = UIImage(named: "professoracorn")
                
                self.textLabel.text = "OK then, which one do you want?"
                
                self.numberOfTaps = 6
                
            }))
            
            present(alert4, animated: true, completion: nil)
        }
        else if numberOfTaps == 9
        {
            imageView.image = UIImage(named: "professoracorn")
            
            textLabel.text = "Now, \(player.name), it's time to enter the world of Pikamon!"
            
            tapToContinueLabel.titleLabel?.text = "Tap here to continue."
            
            tapToContinueLabel.isEnabled = true
        }
        
    }
}

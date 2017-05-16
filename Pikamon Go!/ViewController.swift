//
//  ViewController.swift
//  Pikamon Go!
//
//  Created by student8 on 4/26/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player = Player()
    
    
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
                
                self.player.name = nameAnswer!
                
                self.textLabel.text = "\(self.player.name), huh? That's a fine name."
                
            }))
            
            alert.addAction(UIAlertAction(title: "I don't have a name", style: .cancel, handler: { (response) in
                
                self.textLabel.text = "Oh come now. Everyone has a name. Why not tell me yours?"
                
                let alert2 = UIAlertController(title: "What's your name?", message: "", preferredStyle: .alert)
                
                alert2.addTextField(configurationHandler: { (alertTextField) in
                    
                    alertTextField.placeholder = "Name"
                    
                    alertTextField.autocapitalizationType = UITextAutocapitalizationType.sentences
                })
                
                alert2.addAction(UIAlertAction(title: "OK", style: .default, handler: { (response) in
                    
                    self.player.name = (alert2.textFields?[0].text)!
                    
                    self.textLabel.text = "\(self.player.name), huh? That's a fine name."
                    
                }))
                
                self.present(alert2, animated: true, completion: nil)
                
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
                
                self.player.pikamonInInventory.append(pikamon.Firemander)
                
                self.imageView.image = UIImage(named: "firemanderImage")
                
                self.textLabel.text = "Firemander, the fire type Pikamon. This is the one you want?"
                
            }))
            
            alert3.addAction(UIAlertAction(title: "Lonelysore", style: .default, handler: { (response) in
                
                self.player.pikamonInInventory.append(pikamon.Lonelysore)
                
                self.imageView.image = UIImage(named: "lonelysoreImage")
                
                self.textLabel.text = "Lonelysore, the grass type Pikamon. Seriously? This is the one you want?"
                
            }))
            
            
            alert3.addAction(UIAlertAction(title: "Purple", style: .default, handler: { (response) in
                
                self.player.pikamonInInventory.append(pikamon.purple)
                
                self.imageView.image = UIImage(named: "purpleImage")
                
                self.textLabel.text = "Purple, the water type Pikamon. This is the one you want?"
                
            }))
            
            present(alert3, animated: true, completion: nil)
            
        }
        else if numberOfTaps == 8
        {
            let alert4 = UIAlertController(title: "Are you sure?", message: "", preferredStyle: .alert)
            
            alert4.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                
                self.textLabel.text = "OK, then. You've decided on \(self.player.pikamonInInventory[0].name)."
                
            }))
            
            alert4.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
                
                self.player.pikamonInInventory.removeAll()
                
                self.textLabel.text = "OK then, which one do you want?"
                
                self.imageView.image = UIImage(named: "whiteness")
                
                self.numberOfTaps = 6
                
            }))
            
            present(alert4, animated: true, completion: nil)
        }
        else if numberOfTaps == 9
        {
            textLabel.text = "Now, \(self.player.name), it's time to enter the world of Pikamon!"
            
            tapToContinueLabel.titleLabel?.text = "Tap here to continue."
            
            tapToContinueLabel.isEnabled = true
        }
        
    }
}

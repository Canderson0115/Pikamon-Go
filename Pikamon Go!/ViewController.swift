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
    
    
    @IBOutlet weak var textLabel: UITextView!
    
    @IBOutlet weak var tapToContinueText: UIButton!
    
    
    
    var numberOfTaps = 0
    
    var help = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Welcome to the world of Pikamon Go!"
        
        tapToContinueText.setTitle("", for: .disabled)
        
        tapToContinueText.setTitle("Tap here to continue.", for: .normal)
        
        tapToContinueText.isEnabled = false
        
    }
    
    
    @IBAction func tapToContinue(_ sender: UITapGestureRecognizer) {
        
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
            
            textLabel.text = "Pikamon are creatures that inhabit this world. Some use them to battle. Others... Well, that's actually about it."
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
            })
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (response) in
                
                self.player.name = (alert.textFields?[0].text)!
                
                self.textLabel.text = "\(self.player.name), huh? That's a fine name."
                
            }))
            
            alert.addAction(UIAlertAction(title: "I don't have a name", style: .cancel, handler: { (response) in
                
                self.textLabel.text = "Oh come now. Everyone has a name. Why not tell me yours?"
                
                let alert2 = UIAlertController(title: "What's your name?", message: "", preferredStyle: .alert)
                
                alert2.addTextField(configurationHandler: { (alertTextField) in
                    alertTextField.placeholder = "Name"
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
            textLabel.text = "Now, it's time to enter the world of Pikamon!"
            
            tapToContinueText.titleLabel?.text = "Tap here to continue."
            
            tapToContinueText.isEnabled = true
        }
        
    }
    
    
    
    
}


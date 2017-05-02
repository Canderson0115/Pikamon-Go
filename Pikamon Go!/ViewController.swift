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
    
    @IBOutlet weak var tapToContinueLabel: UILabel!
    
    
    var numberOfTaps = 0
    
    var help = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Welcome to the world of Pikamon Go!"
        
        tapToContinueLabel.text = ""
        
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
                alertTextField.placeholder = "name"
            })
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (response) in
                
                self.player.name = (alert.textFields?[0].text)!
                
            }))
            
            alert.addAction(UIAlertAction(title: "I don't have a name", style: .cancel, handler: { (response) in
                
                self.textLabel.text = ""
                
            }))
            
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    
    
}


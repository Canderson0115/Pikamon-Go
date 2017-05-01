//
//  ViewController.swift
//  Pikamon Go!
//
//  Created by student8 on 4/26/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
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
            textLabel.text = ""
        }
        
        
    }
    
    
    
    
}


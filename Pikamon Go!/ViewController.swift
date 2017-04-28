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
    
    
    var timer = Timer()
    
    var numberOfTaps = 0
    
    var help = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer(timeInterval: 2.0, target: self, selector: #selector(tapContinueAppear), userInfo: Any?.self, repeats: true)
        
        timer.fire()
        
        print(timer)
        
        textLabel.text = "Welcome to the world of Pikamon Go!"
        
        tapToContinueLabel.text = ""
        
    }
    
    func tapContinueAppear()
    {
        
        help += 1
        
        print(help)
        
        tapToContinueLabel.text = "Tap to continue"
        
        timer.invalidate()
        
    }
    
    
    @IBAction func tapToContinue(_ sender: UITapGestureRecognizer) {
        
        timer.fire()
        
        numberOfTaps += 1
        
        if numberOfTaps == 1
        {
            textLabel.text = "I am the Pikamon Professor, Professor Mango."
        }
        
    }
    
    
    
    
}


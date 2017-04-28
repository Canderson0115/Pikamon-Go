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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer(timeInterval: 2.0, target: self, selector: #selector(tapContinueAppear), userInfo: Any?.self, repeats: true)
        
        timer.fire()
        
        textLabel.text = "Welcome to the world of Pikamon Go!"
        
        tapToContinueLabel.text = ""
        
    }

    func tapContinueAppear()
    {
        
        timer.invalidate()
        
        tapToContinueLabel.text = "Tap to continue"
        
    }
    

    
   


}


//
//  Menu.swift
//  Pikamon Go!
//
//  Created by student8 on 5/19/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class MenuPopover: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = CGSize(width: 200, height: 270)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(MenuPopover.dismiss(_:)))
        
        
        
    }
    
    func dismiss(_ sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}

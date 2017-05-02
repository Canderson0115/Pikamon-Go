//
//  Pikapedia.swift
//  Pikamon Go!
//
//  Created by student8 on 5/2/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class Pikapedia: UIViewController {

@IBOutlet weak var PikamonList: UITableView!
    
var PikamonViewer:[Pikamon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return PikamonViewer.count
    }

}

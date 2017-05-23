//
//  PikamonInInventoryViewController.swift
//  Pikamon Go!
//
//  Created by student8 on 5/22/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view loaded")
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(player.pikamonInInventory.count)
        
        return player.pikamonInInventory.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        
//        let p = player.pikamonInInventory[indexPath.row]
        
        for p in player.pikamonInInventory
        {
            
            myCell?.textLabel?.text = p.name
            
            myCell?.detailTextLabel?.text = String(p.health)
            
        }
        
        print(player.pikamonInInventory[0].name)
        
        return myCell!
        
    }
    
}

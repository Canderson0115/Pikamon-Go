//
//  Pikapedia.swift
//  Pikamon Go!
//
//  Created by student8 on 5/2/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit

class Pikapedia: UIViewController, UITableViewDataSource, UITableViewDelegate
{

@IBOutlet weak var PikamonList: UITableView!
    
    var pikapedia = [String:[String]]()
    
    var pikamonDetails = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        PikamonList.dataSource = self
        
        PikamonList.delegate = self
        
        
        
        //pikamonNames = pikamon.listPropertiesWithValues()
        
        func createPikapedia()
        {
            
            
            for i in pikamon.pikamonList
            {
                
                pikamonDetails.append("Health: " + String(i.health))
                
                pikamonDetails.append(String(i.type[0].classIdentifier))
                
                for s in i.type
                {
                    pikamonDetails.append("Type: " + String(s.classIdentifier))
                }
                
                pikamonDetails.append("Health: " + String(i.weight))
                
                for p in i.moveSet
                {
                    pikamonDetails.append(String(p.name))
                }
                
                pikapedia[i.name] = pikamonDetails
                
                pikamonDetails.removeAll()
                
            }
        }
        
        createPikapedia()
        
        print(pikapedia)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return pikapedia.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")! as UITableViewCell
        
        var array: [String] = []
        
        for x in pikapedia
        {
            array.append(x.key)
        }
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell

    }
    
}

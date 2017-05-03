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
    
    var pikamonNames = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        PikamonList.dataSource = self
        
        //pikamonNames = pikamon.listPropertiesWithValues()
        
        func help()
        {
            for i in pikamon.pikamonList
            {
                print(i.health)
                pikamonNames.append(i.name)
            }
        }
        
        help()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return pikamonNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")! as UITableViewCell
        
        cell.textLabel?.text = pikamonNames[indexPath.row]
        
        return cell

    }
    
}

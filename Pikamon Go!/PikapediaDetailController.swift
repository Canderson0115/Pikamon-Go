//
//  PikapediaDetailController.swift
//  Pikamon Go!
//
//  Created by student0 on 5/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation
import UIKit
//EFWEWFW
class DetailView: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var pikapediaDetailData = [String:[String]]()

    var indexS = String()
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var pikamonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        self.title = pikapediaDetailData[indexS]?[0].replacingOccurrences(of: "Name: ", with: "")
        for data in pikapediaDetailData[indexS]!
        {
            print(data)
            switch data
            {
            case "Name: Firemander" : pikamonImage.image = pikamon.Firemander.image
            
            case "Name: Tatarat" : pikamonImage.image = pikamon.LizieChu.image
            
            case "Name: Glacierite" : pikamonImage.image = pikamon.Glacierite.image
            
            case "Name: Bochtite" : pikamonImage.image = pikamon.Bochtite.image
            
            case "Name: Trithyta" : pikamonImage.image = pikamon.Trithyta.image
            
            case "Name: Pokéchew" : pikamonImage.image = pikamon.Pokéchew.image
        
            case "Name: Lonelysore" : pikamonImage.image = pikamon.Lonelysore.image
            
            case "Name: Purple" : pikamonImage.image = pikamon.purple.image
                
            default : print("")
            
            }
            switch data
            {
            case "Type: 1" :
            
                let i = pikapediaDetailData[indexS]?.index(of: "Type: 1")
                pikapediaDetailData[indexS]?[i!] = "Type: Fire"
                
            case "Type: 0" :
            
                let i = pikapediaDetailData[indexS]?.index(of: "Type: 0")
                pikapediaDetailData[indexS]?[i!] = "Type: Normal"
                
            default: print("")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (pikapediaDetailData[indexS]?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detail")! as UITableViewCell
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.text = pikapediaDetailData[indexS]?[indexPath.row]
        
        return cell
        
    }

    
}

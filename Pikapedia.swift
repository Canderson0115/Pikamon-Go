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
    
    var seguePath = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        PikamonList.dataSource = self
        
        PikamonList.delegate = self
        
        func createPikapedia()
        {
            
            
            for i in pikamon.pikamonList
            {
                
                pikamonDetails.append("Health: " + String(i.health))
                
                for s in i.type
                {
                    pikamonDetails.append("Type: " + String(s.classIdentifier))
                }
                
                
                var temp = String()
                
                for p in i.moveSet
                {
                    temp.append(String(p.name)  + ", ")
                }
                
                temp.remove(at: temp.index(before: temp.endIndex))
                temp.remove(at: temp.index(before: temp.endIndex))

                
                pikamonDetails.append(String("Moves: \(temp)"))
                
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        seguePath = (tableView.cellForRow(at: indexPath)?.textLabel?.text)!
        print(seguePath)
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let destination = segue.destination as! DetailView
        destination.pikapediaDetailData = pikapedia
        destination.indexS = seguePath
    }
    
}

//
//  PikapediaDetailController.swift
//  Pikamon Go!
//
//  Created by student0 on 5/4/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import Foundation
import UIKit

class DetailView: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var pikapediaDetailData = [String:[String]]()

    var indexS = String()
    
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        for data in pikapediaDetailData[indexS]!
        {
            if data == "Type: 1"
            {
                let i = pikapediaDetailData[indexS]?.index(of: "Type: 1")
                pikapediaDetailData[indexS]?[i!] = "Type: Fire"
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
        
        
        cell.textLabel?.text = pikapediaDetailData[indexS]?[indexPath.row]
        
        return cell
        
    }

    
}

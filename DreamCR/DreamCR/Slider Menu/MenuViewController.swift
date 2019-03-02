//
//  MenuViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 02/03/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return title_Arr.count
        }
        
        return 0
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    @IBOutlet weak var MenuTable: UITableView!
    let title_Arr = ["Profile", "Changin Room", "Measurments", "Settings", "Camera", "Log out"]
    override func viewDidLoad() {
        super.viewDidLoad()

MenuTable.delegate = self
        
        MenuTable.dataSource = self
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return title_Arr.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Menu_cell") as! MenuTableViewCell
        cell.Profile.text = title_Arr[indexPath.row]
        return cell
    }
}

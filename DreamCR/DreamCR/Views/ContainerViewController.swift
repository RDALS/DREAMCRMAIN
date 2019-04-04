//
//  HomeViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 28/03/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var sidemenuContraint: NSLayoutConstraint!
    
    var sidemenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // using an observer
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleMenu), name: NSNotification.Name("ToggleMenu"), object: nil)
        
        
    }
    
    
  
    @objc func toggleMenu() {
        if sidemenuOpen {
            sidemenuOpen = false
            sidemenuContraint.constant = -196
        }
        
        else {
            sidemenuOpen = true
            sidemenuContraint.constant = 0
        }
        
        
    }
  
    
  
 
   
    
        
      
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}

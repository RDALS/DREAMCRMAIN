//
//  ProfileSettingsViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 10/04/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ProfileSettingsViewController: UIViewController {

    // Menu Coding Aspect
    @IBOutlet var Sizes: [UIButton]!
   
    @IBOutlet var Gendr: [UIButton]!
    
    
    //DataBaseProfileUpdate
     @IBOutlet weak var PImage: UIImageView!
    @IBOutlet weak var Uname: UITextField!
    
    
    var refUser : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
          refUser = Database.database().reference().child("Users")
        
       
        
    }
    
   
   
    
   
    
    func setupProfile() {
        
        
        
        
    }
    
    @IBAction func SelectionS(_ sender: UIButton) {
        
        Sizes.forEach { (Button) in
            Button.isHidden = !Button.isHidden
        }
        
        
        
        
    }
    enum Size: String {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
        
    }
    
    
    @IBAction func IsTapped(_ sender: UIButton) {
        
        guard let Title = sender.currentTitle, let S = Size(rawValue: Title) else {return}
        
        
        switch S {
        case .small:
            print("Small")
        case .medium:
            print("Medium")
        case.large:
            print("Large")
        
            
        }
       
    }
    
    
    
    @IBAction func Cancel(_ sender: Any) {
        
   //  self.view.d
    }
    
    
// Radio Buttons
    
    @IBAction func FillTap(_ sender: UIButton) {
        
        if sender.isSelected {
            sender.isSelected = false
            
            
        }
        else {
            sender.isSelected = true
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

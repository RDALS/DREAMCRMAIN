//
//  HomeViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 04/02/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var Male: UIButton!
    @IBOutlet var Female: UIButton!
    @IBOutlet var Sizes: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func HandleSelection(_ sender: UIButton) {
        
        Sizes.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden

            })
        
            
        }
        
        
        
    }
    
    enum Size:String {
        case small = "Small"
        case medium = "Medium"
        case large = "Large"
        
    }
    
    @IBAction func SizeSelect(_ sender: UIButton) {
        guard let title = sender.currentTitle, let sizes = Size(rawValue: title) else {
            return
        }
        switch sizes {
        case .small:
            print("small")
        default:
            print("small")
            
        }
        
        
    }
    
    
    @IBAction func BttnTapped(_ sender:UIButton) {
        
        if sender.currentImage == UIImage(named: "Unchecked") {
            sender.setImage(UIImage(named: "Checked"), for: .normal)
        }
        
        else {
            sender.setImage(UIImage(named: "Unchecked"), for: .normal)
        }
        
    }
   
}

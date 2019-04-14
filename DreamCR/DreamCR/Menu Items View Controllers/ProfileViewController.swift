//
//  ProfileViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 12/04/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    // Variables

    @IBOutlet weak var ProfilePicture: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    
    @IBOutlet weak var Gender: UILabel!
    
    @IBOutlet weak var Size: UILabel!
    
    var Dataref : DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Dataref = Database.database().reference()
        
        if let UserId = Auth.auth().currentUser?.uid {
            
            Dataref.child("Users/Users").child(UserId).observeSingleEvent(of: .value) { (snapshot) in
                let dictionary = snapshot.value as? NSDictionary
                
               
                
                let username = dictionary?["UserName"] as? String ?? "username"
                let Gender = dictionary?["Gender"] as? String ?? "Female"
                let Size = dictionary?["Size"] as? String ?? "Small"
                
                
                if let profileimageURl = dictionary?["Photo"] as? String {
                    
                    let url = URL(string: profileimageURl)
                    
                    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                        if error != nil  {
                            print(error!)
                            return
                        }
                        DispatchQueue.main.async {
                            self.ProfilePicture.image = UIImage(data: data!)
                        }
                    
                    }).resume()
                 
                }
                
                self.UserName.text = username
                self.Gender.text = Gender
                self.Size.text = Size

                
                
            }
            
            
            
            
        }
    }
    
    @IBAction func Settings(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSetting")
        self.present(vc!, animated: true, completion: nil)
       

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

//
//  LoginViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 04/02/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var LEmail: UITextField!
    @IBOutlet var LPassword: UITextField!
      @IBOutlet var LogIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        if let email = LEmail.text, let pass = LPassword.text {
            
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                else if let user = user {
                  //  print(user.uid)
                }
            }
            
            
            
            
        }
        // Do any additional setup after loading the view.
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

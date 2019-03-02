//
//  LoginViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 04/02/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var LEmail: UITextField!
    @IBOutlet var LPassword: UITextField!
     // @IBOutlet var LogIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    
    
  
    @IBAction func LogingIn(_ sender: Any) {
        
        if LEmail.text == "" || LPassword.text == "" {
            // Allert the user of the error
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        else {
            
            guard let email = LEmail.text else {return}
            guard let password = LPassword.text else {return}
            
              Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error == nil
            {
                // log print
                print("Log in succesful")
                
                // Go to the Home Screen
           //     self.performSegue(withIdentifier: "Home", sender: self)
               let vc = self.storyboard?.instantiateViewController(withIdentifier: "UiNav")
               self.present(vc!, animated: true, completion: nil)
                
                }
                
            else {
                
                
                //Tells the user that there is an error and then gets firebase to tell them the error
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)

                }
            
            
            
            
            
            
            
        }
        
        
        
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

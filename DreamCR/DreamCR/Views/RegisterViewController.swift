//
//  RegisterViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 04/02/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {
    // Text Boxes
    @IBOutlet var Remailbox: UITextField!
    @IBOutlet var Rpasswordbox: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    
   
    
    
   

    // Conditions to register
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Setting" {
            
            if (Rpasswordbox.text == "") {
                
                return false
            } else {
                return true
            }
            
            
            
        }
        
        return true
        
    }
   

    @IBAction func RegisterButton(_ sender: UIButton) {
        
     //   HandleSinUp()
        
        if Remailbox.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            
            guard let  email = Remailbox.text else {return};
            guard let  RPassword = Rpasswordbox.text else {return};
            
            Auth.auth().createUser(withEmail: email, password: RPassword) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Setting")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
      
    //  shouldPerformSegue(withIdentifier: "Setting", sender: self)
        
            
        }
        
        
    
        
        
        /*
        @objc func HandleSinUp() {
            
            guard let  email = Remailbox.text else {return};
              guard let  RPassword = Rpasswordbox.text else {return};
            
        

            
            
            Auth.auth().createUser(withEmail: email, password: RPassword) { (user, error) in
                // ...
                //Check the user isnt nill
                if error == nil && email != nil{
                    // user is found go to home screen
                    print("User Created")
                }
                else {
                    
print("Failed")
                    
                    
                }
                
                if error == nil && RPassword != nil {
                    //Log in is successful
                    
                    print("Password success")
                    
                    
                    
                }
                else {
                    
print("failed")
                    
                    
                    
                }
                
            }
            
        }
        

    
    
        */
    
        
        
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        /*
        
    if let email = Remailbox.text, let pass = Rpasswordbox.text, let rpass = Rrpasswordbox.text
    {
     
        Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
            // ...
            //Check the user isnt nill
            if  let u = user {
                // user is found go to home screen
               self.performSegue(withIdentifier: "GoToHome", sender:self )
            }
            else {
                
                // Error: check error and show message
            }
            
            if pass == rpass {
                //Log in is successful
                self.performSegue(withIdentifier: "GoToHome", sender: self
                )

            }
            else {
             // Error in development
            }
                
            }
        }
    */
       
       
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




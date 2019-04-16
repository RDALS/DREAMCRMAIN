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
import SDWebImage

class ProfileSettingsViewController: UIViewController {

    // Menu Coding Aspect
    @IBOutlet var Sizes: [UIButton]!
   
    @IBOutlet var Gendr: [UIButton]!
    
    // Selection Options
    
    @IBOutlet weak var Male: UIButton!
    @IBOutlet weak var Female: UIButton!
    
    var Sex: String?
    var Weight: String?
    
    //DataBaseProfileUpdate fields
     @IBOutlet weak var PImage: UIImageView!
    @IBOutlet weak var Uname: UITextField!
    
    // Database Code
    var refUser : DatabaseReference!
    var refstorage: StorageReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
          refUser = Database.database().reference().child("Users")
        
        refstorage = Storage.storage().reference()
        
        LoadUserInfo()
       
        
    }
    
    
    //load USer profile
    
    func LoadUserInfo() {
        
        
        //user log in info
        if let UserId = Auth.auth().currentUser?.uid {
            refUser.child("Users/Users").child(UserId).observeSingleEvent(of: .value) { (snapshot) in
                // Creat Dictionary
                let Values = snapshot.value as? NSDictionary
                
                //Image storage
                if let profileImageURL = Values?["Photo"] as? String{
                    
                    self.PImage.sd_setImage(with: URL(string: profileImageURL))
                    
                }
                
                //UserName
                
                self.Uname.text = Values?["UserName"] as! String
                self.Sex = Values?["Gender"] as! String
                self.Weight = Values?["Size"] as! String
              
                
              
                
                
                
            }
                
        }
            
    }
   
    
    func SelectGender() {
        
        if Male.isSelected {
            Sex = "Male"
        }
        if Female.isSelected {
            Sex = "Female"
        }
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
            Weight = "Small"
        case .medium:
            print("Medium")
            Weight = "Medium"
        case.large:
            print("Large")
            Weight = "Large"
        
            
        }
       
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
    
    // Save Everyhting
    
    @IBAction func SaveProfile(_ sender: UIButton) {
        
        UpdateUserProfile()
    }
    
    func UpdateUserProfile() {
        
// Check to see if user is logged in
        
        if let UserID = Auth.auth().currentUser?.uid{
        //creat an acces point to the storage
            let storageItem = refstorage.child("Profile_Images").child(UserID)
        // Get the image uploaded from library
            guard let image = PImage.image else {return}
            if let newImage = image.pngData() {
                
            
        //Upload it to firebase
                
                storageItem.putData(newImage, metadata: nil) { (metadata, error) in
                    if error != nil {
                        return
                    }
                    
                    storageItem.downloadURL(completion: { (url, error) in
                        if error != nil {return}
                        var ProfilePhotoUrl = url!.absoluteString
                        if  ProfilePhotoUrl == url!.absoluteString {
                            guard let UserName = self.Uname.text else {return}
                            guard let Gendr = self.Sex else {return}
                            guard let Size = self.Weight else {return}
                        
                            
                            let newValues = [
                                "Photo": ProfilePhotoUrl,
                                "UserName": UserName,
                                "Gender": Gendr,
                                "Size": Size
                            ]
                            
                            //Update Firebase Database for that user
                        self.refUser.child("User").child(UserID).updateChildValues(newValues)

                        }
                    })
                }
            }
            
        
    }
        
        
        
    }
    
    
    
    // Cancelling
   
    @IBAction func CancelBttn(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
            
        
    }
    
    
    
    // SelectingImage from Mobile
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ProfileViewController.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/7/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    let data = Data.sharedInstance
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var companyField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneField: UITextField!
    
    
    @IBAction func updateButton(_ sender: Any) {
        updateUserFromForm()
    }
   

    func updateUserFromForm(){
        
        DispatchQueue.global().async {
         
            self.data.databaseRef.child("user_profiles").child(self.data.userID()).child("name").setValue(self.nameField.text)
            self.data.databaseRef.child("user_profiles").child(self.data.userID()).child("company").setValue(self.companyField.text)
            self.data.databaseRef.child("user_profiles").child(self.data.userID()).child("email").setValue(self.emailField.text)
            self.data.databaseRef.child("user_profiles").child(self.data.userID()).child("phone").setValue(self.phoneField.text)
            
            DispatchQueue.main.async(execute: {
                
            })
        }
        
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateDisplays() {
        data.databaseRef.child("user_profiles").child(data.userID()).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let userDict: NSDictionary = snapshot.value as! NSDictionary
            
            self.nameField.text = userDict["name"] as? String
            self.companyField.text = userDict["company"] as? String
            self.emailField.text = userDict["email"] as? String
            self.phoneField.text = userDict["phone"] as? String
            
            
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDisplays()
        
    }

}

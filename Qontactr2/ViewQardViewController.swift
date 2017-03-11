//
//  ViewQardViewController.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/8/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

extension Bool{
    mutating func toggle(){
        if self {
            self = false
        } else if !self {
            self = true
        }
    }
}



class ViewQardViewController: UIViewController {

    var key:String = ""
    
    //label/textfield combos
    let data = Data.sharedInstance
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var companyField: UITextField!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var websiteLabel: UILabel!
    @IBOutlet var websiteField: UITextField!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editButton(_ sender: Any) {
        if !nameField.isHidden{
            updateDBEntryFromForm()
        }
        updateLabels()
        swapHidden()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").child(key).removeValue()
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //function to make all labels and fields switch their hidden state
    func swapHidden(){
        nameField.isHidden.toggle()
        companyField.isHidden.toggle()
        emailField.isHidden.toggle()
        phoneField.isHidden.toggle()
        websiteField.isHidden.toggle()
        nameLabel.isHidden.toggle()
        companyLabel.isHidden.toggle()
        emailLabel.isHidden.toggle()
        phoneLabel.isHidden.toggle()
        websiteLabel.isHidden.toggle()
    }
    
    func updateLabels() {
        
        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").child(key).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let qardDict = snapshot.value! as! NSDictionary
            
            self.nameLabel.text = qardDict["name"] as? String ?? ""
            self.companyLabel.text = qardDict["company"] as? String ?? ""
            self.emailLabel.text = qardDict["email"] as? String ?? ""
            self.phoneLabel.text = qardDict["phone"] as? String ?? ""
            self.websiteLabel.text = qardDict["website"] as? String ?? ""
            
        })
        
    }
    
    func updateFields(){
        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").child(key).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let qardDict = snapshot.value! as! NSDictionary
            
            self.nameField.text = qardDict["name"] as? String ?? ""
            self.companyField.text = qardDict["company"] as? String ?? ""
            self.emailField.text = qardDict["email"] as? String ?? ""
            self.phoneField.text = qardDict["phone"] as? String ?? ""
            self.websiteField.text = qardDict["website"] as? String ?? ""
            
        })
    }
    
    func updateDBEntryFromForm(){
        let dbEntry = data.databaseRef.child("user_profiles").child(data.userID()).child("qards").child(key)
        dbEntry.child("name").setValue(nameField.text)
        dbEntry.child("company").setValue(companyField.text)
        dbEntry.child("email").setValue(emailField.text)
        dbEntry.child("phone").setValue(phoneField.text)
        dbEntry.child("website").setValue(websiteField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Key: \(key)")
        
        nameField.isHidden = true
        companyField.isHidden = true
        emailField.isHidden = true
        phoneField.isHidden = true
        websiteField.isHidden = true
        
        let view = UIView()
        view.bounds = self.view.bounds
        view.addSubview(UIActivityIndicatorView())
        view.backgroundColor = UIColor.red
        
        self.view.addSubview(view)
        self.view.bringSubview(toFront: view)
        
        updateLabels()
        updateFields()
        
        view.removeFromSuperview()
        
    }


}

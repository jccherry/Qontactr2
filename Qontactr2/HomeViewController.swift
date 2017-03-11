//
//  HomeViewController.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/7/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import UIKit
import FirebaseDatabase
import GoogleSignIn
import FirebaseAuth

class HomeViewController: UIViewController {
    
    //let databaseRef: FIRDatabaseReference!
    let data = Data.sharedInstance
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBAction func signOutButton(_ sender: Any) {
        try! FIRAuth.auth()!.signOut()
        GIDSignIn.sharedInstance().signOut()
        print("Signing Out")
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func profileButton(_ sender: Any) {
        self.performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    @IBAction func newQardButton(_ sender: Any) {
        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").childByAutoId().child("name").setValue("John Chiaramonte")
    }
    
    @IBAction func qardViewButton(_ sender: Any) {
        self.performSegue(withIdentifier: "qardViewSegue", sender: nil)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.databaseRef.child("user_profiles").child(data.userID()).observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot)
            
            let dict = snapshot.value as! NSDictionary
            
            print(dict)
            
            let stringValue = dict["name"] as! String
            
            self.nameLabel.text = stringValue
            
            
        })
        

        
        
        
    }


}

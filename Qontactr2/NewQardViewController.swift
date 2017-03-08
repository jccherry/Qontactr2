//
//  NewQardViewController.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/7/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NewQardViewController: UIViewController {

    let data = Data.sharedInstance
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").childByAutoId().child("name").setValue("John Chiaramonte")
        
        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").observeSingleEvent(of: .value, with: { (snapshot) in
            let dict = snapshot.value as! NSDictionary
            print(dict)
        })
    }


}

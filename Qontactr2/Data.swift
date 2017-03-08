//
//  Data.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/7/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class Data{
    
    
    static let sharedInstance = Data()
    init(){}
    
    var numberQards: Int = 0
    
    
    //reference to the firebase database
    let databaseRef: FIRDatabaseReference = FIRDatabase.database().reference()
    
    //user id string that allows a user to access properties    
    func userID() -> String {
        return (FIRAuth.auth()?.currentUser?.uid)!
    }
    
    
}

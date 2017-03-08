//
//  QardsViewController.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/8/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class QardsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let data = Data.sharedInstance
    var qardSnaps = [FIRDataSnapshot]()
    var qards = [Qard]()
    var qardNames = [String]()

    @IBOutlet var qardTable: UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = qardNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qardNames.count
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").observeSingleEvent(of: .value, with: { (snapshot) in
        
            //let dict = snapshot.value! as! NSDictionary
            
            for item in snapshot.children{
                self.qardSnaps.append(item as! FIRDataSnapshot)
            }
            
            let keys = ((snapshot.value as AnyObject).allKeys)! as? [String]
            print(keys)
            
            var count: Int = 0
            for qard in self.qardSnaps{
                
                
                let dict = qard.value! as! NSDictionary
                
                self.qardNames.append((dict["name"] as? String)!)
                print((dict["name"] as? String)!)
                
                self.qardTable.reloadData()
 
                /*
                let newQard = Qard(name: (dict["name"] as? String)!)
                newQard.key =
                
                count +=1
                */
            }
            
        })
        
        print(qardNames)
    
        
        
    }


}

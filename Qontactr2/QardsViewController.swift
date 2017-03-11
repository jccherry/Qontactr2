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
    var didLoadLast = true


    @IBOutlet var qardTable: UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QardTableViewCell
        
        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let keys = ((snapshot.value as AnyObject).allKeys)! as? [String]
            //print(keys?[indexPath.row] ?? "")
            
            
            let sortedKeys = keys?.sorted()
            
            let key:String = (sortedKeys?[indexPath.row])!
            cell.keyString = key
            
            self.data.databaseRef.child("user_profiles").child(self.data.userID()).child("qards").child(key).observeSingleEvent(of: .value, with: { (snapshot) in
                
                let qardDict = snapshot.value! as! NSDictionary
                
                cell.nameLabel?.text = qardDict["name"] as? String ?? "Meme"
            })
            
            
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qardSnaps.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let destVC: ViewQardViewController = ViewQardViewController()
        
        destVC.key = (tableView.cellForRow(at: indexPath) as! QardTableViewCell).keyString
        
        self.present(destVC, animated: true, completion: nil)
 
    }
    
    func reloadTable(){

        data.databaseRef.child("user_profiles").child(data.userID()).child("qards").observeSingleEvent(of: .value, with: { (snapshot) in
            self.qardSnaps = []
            
            for item in snapshot.children{
                self.qardSnaps.append(item as! FIRDataSnapshot)

            }

            self.qardTable.reloadData()
            
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reloadTable()
    
    }

    override func viewDidAppear(_ animated: Bool) {
        
        if didLoadLast {
            didLoadLast = false
        } else {
            reloadTable()
        }

    }


}

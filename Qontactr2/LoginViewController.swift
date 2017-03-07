//
//  ViewController.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/7/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, GIDSignInUIDelegate{

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //google sign in code
        GIDSignIn.sharedInstance().uiDelegate = self

    }

}


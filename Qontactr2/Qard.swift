//
//  Qard.swift
//  Qontactr
//
//  Created by John Chiaramonte on 10/26/16.
//  Copyright © 2016 John Chiaramonte. All rights reserved.
//

import Foundation
import UIKit

class Qard: NSObject {
    
    var name: String
    var companyName: String = ""
    var phoneNumber: String = ""
    var emailAddress: String = ""
    var twitter: String = ""
    var linkedin: String = ""
    var facebook: String = ""
    var instagram: String = ""
    var website: String = ""
    var key: String = ""
    
    var profileImage: UIImage = UIImage(named: "qontactrappicon")!
    
    init(name: String){
        self.name = name
    }
    
    func jsonify(title: String,value: String) -> String {
        var jsonString = ""
        
        jsonString = "\"" + title + "\":\"" + value + "\","
        
        return jsonString
    }
    
    func phoneLink() -> String {
        return "tel:\(phoneNumber)"
    }
    func emailLink() -> String {
        return "mailto:\(emailAddress)"
    }
    func linkedInLink() -> String {
        return "http://linkedin.com/in/\(linkedin)"
    }
    func twitterLink() -> String {
        return "http://twitter.com/\(twitter)"
    }
    func facebookLink() -> String {
        return "http://facebook.com/\(facebook)"
    }
    func instagramLink() -> String {
        return "instagram://user?username=\(instagram)"
    }
    func websiteLink() -> String {
        if website.hasPrefix("http://") && website.hasPrefix("https://") {
            return website
        } else {
            return "http://\(website)"
        }
    }
    
}

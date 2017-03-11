//
//  QardTableViewCell.swift
//  Qontactr2
//
//  Created by John Chiaramonte on 3/11/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import UIKit

class QardTableViewCell: UITableViewCell {

    var keyString: String = ""
    
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

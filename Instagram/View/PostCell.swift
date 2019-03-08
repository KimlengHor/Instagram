//
//  PostCell.swift
//  Instagram
//
//  Created by hor kimleng on 3/7/19.
//  Copyright © 2019 hor kimleng. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

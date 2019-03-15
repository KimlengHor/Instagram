//
//  CommentCell.swift
//  Instagram
//
//  Created by hor kimleng on 3/14/19.
//  Copyright © 2019 hor kimleng. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {

    //IBOulets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

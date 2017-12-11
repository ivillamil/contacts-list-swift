//
//  ContactTableViewCell.swift
//  Contacts
//
//  Created by Iván Villamil Covián on 12/10/17.
//  Copyright © 2017 Iván Villamil Covián. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var separatorLineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bodyView.layer.cornerRadius = 20
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.layer.masksToBounds = true
        separatorLineView.layer.cornerRadius = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

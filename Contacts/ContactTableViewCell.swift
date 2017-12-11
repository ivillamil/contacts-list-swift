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
        
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 2.0
        avatarImageView.layer.borderColor = UIColor(red: 90/255, green: 73/255, blue: 124/255, alpha: 1.0).cgColor
        
        bodyView.layer.cornerRadius = 20
        separatorLineView.layer.cornerRadius = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

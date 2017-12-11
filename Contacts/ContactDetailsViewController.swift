//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Iván Villamil Covián on 12/11/17.
//  Copyright © 2017 Iván Villamil Covián. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactTitleLabel: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var currentContact: Contact!
    
    override func viewWillAppear(_ animated: Bool) {
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderWidth = 4.0
        avatarImage.layer.borderColor = UIColor(red: 90/255, green: 73/255, blue: 124/255, alpha: 1.0).cgColor
        bubbleView.layer.cornerRadius = 20
        
        let triangleView = UIView(frame: CGRect(x: 20.0, y: -8.0, width: 20.0, height: 20.0))
        triangleView.backgroundColor = UIColor(red: 48/255, green: 35/255, blue: 74/255, alpha: 1.0)
        triangleView.transform = CGAffineTransform(rotationAngle: 0.706858)
        
        bubbleView.addSubview(triangleView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.image = currentContact.avatarImage
        contactNameLabel.text = currentContact.name
        contactTitleLabel.text = currentContact.title
        descriptionLabel.text = currentContact.description
        phoneLabel.text = currentContact.phone
        emailLabel.text = currentContact.email
        addressLabel.text = currentContact.address
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

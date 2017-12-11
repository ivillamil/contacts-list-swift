//
//  ContactModel.swift
//  Contacts
//
//  Created by Iván Villamil Covián on 12/10/17.
//  Copyright © 2017 Iván Villamil Covián. All rights reserved.
//

import UIKit

enum SerializationError: Error {
    case missing(String)
}

struct Contact {
    public let id: Int
    public let address: String
    public let avatar: String
    public let avatarImage: UIImage
    public let description: String
    public let email: String
    public let name: String
    public let phone: String
    public let title: String
    
    public init(json: [String: Any]) throws {
        guard let id = json["id"] as? Int else {
            throw SerializationError.missing("id")
        }
        guard let address = json["address"] as? String else {
            throw SerializationError.missing("address")
        }
        guard let avatar = json["avatar"] as? String else {
            throw SerializationError.missing("avatar")
        }
        guard let description = json["description"] as? String else {
            throw SerializationError.missing("description")
        }
        guard let email = json["email"] as? String else {
            throw SerializationError.missing("email")
        }
        guard let name = json["name"] as? String else {
            throw SerializationError.missing("name")
        }
        guard let phone = json["phone"] as? String else {
            throw SerializationError.missing("phone")
        }
        guard let title = json["title"] as? String else {
            throw SerializationError.missing("title")
        }
        
        let imageURL = URL(string: avatar)
        let imageData = try? Data(contentsOf: imageURL!)
        let image = UIImage(data: imageData!)
        
        self.id = id
        self.address = address
        self.avatar = avatar
        self.avatarImage = image!
        self.description = description
        self.email = email
        self.name = name
        self.phone = phone
        self.title = title
    }
}

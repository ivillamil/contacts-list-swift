//
//  ContactModel.swift
//  Contacts
//
//  Created by Iván Villamil Covián on 12/10/17.
//  Copyright © 2017 Iván Villamil Covián. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case missing(String)
}

struct Contact {
    public let id: Int
    public let address: String
    public let avatar: String
    public let description: String
    public let email: String
    public let name: String
    public let phone: String
    public let title: String
    
    public init(json: [String: Any]) throws {
        guard let avatar = json["avatar"] as? String else {
            throw SerializationError.missing("avatar")
        }
        guard let name = json["name"] as? String else {
            throw SerializationError.missing("name")
        }
        guard let title = json["title"] as? String else {
            throw SerializationError.missing("title")
        }
        
        self.id = 0
        self.address = ""
        self.avatar = avatar
        self.description = ""
        self.email = ""
        self.name = name
        self.phone = ""
        self.title = title
    }
}

//
//  Contact.swift
//  ExampleVipew
//
//  Created by yana mulyana on 23/05/18.
//  Copyright © 2018 yana mulyana. All rights reserved.
//

import Foundation

struct Contact: Codable {
    let id: String
    let email: String
    let gender: String
    let name: String
    let address: String
    let phone: Phone
}

struct Phone: Codable {
    let mobile: String
    let home: String
    let office: String
}

struct ContactResult {
    let contact: [Contact]
}

extension ContactResult: Decodable {
    enum ContactResultCodingKeys: String, CodingKey {
        case contact = "contacts"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ContactResultCodingKeys.self)
        
        contact = try container.decode([Contact].self, forKey: .contact)
    }
}

//
//  User.swift
//  PetCard
//
//  Created by Алексей on 12.11.2022.
//

import Foundation

struct User {
    var name: String
    var mobileNo: String
    var password: String?
    
    var animals: [Animal]?
    var lostAnimals: [Animal]?
    
    static func getUser() -> User {
        return User(
            name: "Zulla",
            mobileNo: "+7-911-911-76-78"
        )
    }
}

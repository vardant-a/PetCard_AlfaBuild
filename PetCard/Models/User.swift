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
    
    var animals: [Animal] = []
}


struct Animal {
    let image: String?
    let name: String
    let anymalType: AnimalType
    let breed: String
    let color: String
    let ownerNumber: String
    
    static func getAnimalLost() -> Animal {
        return Animal(
            image: "1",
            name: "Ray",
            anymalType: .dog,
            breed: "doberman",
            color: "black",
            ownerNumber: "+7-999-495-17-72"
        )
    }
}

enum AnimalType: String {
    case dog = "Dog"
    case cat = "Cat"
}

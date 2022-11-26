//
//  Animal.swift
//  PetCard
//
//  Created by Алексей on 25.11.2022.
//

import Foundation

struct Animal {
    let id = UUID().uuidString
    var name: String
    var image: String? = "avatar"
    var animalType: AnimalType?
    var breed: String?
    var hair: String?
    var sex: Sex?
    var dob: String?
    var statusLost: Bool = false
    
    var animalID: String?
    var qrCode: String?
    var ownerName: String = {
        User.getUser().name
    }()
    var ownerNumber: String = {
        User.getUser().mobileNo
    }()
    
    static func getAnimalList() -> Animal {
        let animal =  Animal(
            name: "Ray",
            animalType: .dog,
            breed: "Doberman",
            hair: "Black",
            sex: .male,
            dob: "11.11.11",
            animalID: "1204120415",
            ownerName: User.getUser().name,
            ownerNumber: User.getUser().mobileNo
        )
        return animal
    }
}

enum Sex: String {
    case male = "Male"
    case female = "Female"
    case notDefined = "Not defined"
}

enum AnimalType: String {
    case dog = "Dog"
    case cat = "Cat"
    case notDefined = "Not defined"
}

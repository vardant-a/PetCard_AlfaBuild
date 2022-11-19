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
    
    static func getUser() -> User {
        return User(
            name: "Aleksei",
            mobileNo: "+7-999-495-17-72"
        )
    }
}



struct Animal {
    let id = UUID().uuidString
    var name: String
    var image: String?
    var anymalType: AnimalType?
    var breed: String?
    var hair: String?
    var sex: Sex
    var dob: String?
    var faceUp: Bool = true
    var ownerName: String = {
        User.getUser().name
    }()
    var ownerNumber: String = {
        User.getUser().mobileNo
    }()
    
    static func getAnimalList() -> Animal {
        let animal =  Animal(
            name: "Ray",
            anymalType: .dog,
            breed: "Doberman",
            hair: "Black",
            sex: .male,
            dob: "11.11.11",
            ownerName: User.getUser().name,
            ownerNumber: User.getUser().mobileNo
        )
        return animal
    }
}

enum Sex: String {
    case male = "Male"
    case female = "Female"
}

enum AnimalType: String {
    case dog = "Dog"
    case cat = "Cat"
}


var getAnimal = Animal.getAnimalList()

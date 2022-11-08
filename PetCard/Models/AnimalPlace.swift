//
//  AnimalPlace.swift
//  PetCard
//
//  Created by Алексей on 03.11.2022.
//

import UIKit
import MapKit

class AnimalPlace: NSObject, MKAnnotation {
    let animalName: String?
    let numberMaster: String?
    let coordinate: CLLocationCoordinate2D
    
    init(animalName: String?, numberMaster: String?, coordinate: CLLocationCoordinate2D) {
        self.animalName = animalName
        self.numberMaster = numberMaster
        self.coordinate = coordinate
        
        super.init()
    }
}

final class LostAnimal {
    static let shared = LostAnimal()
    var lostAnimals: [AnimalPlace] = [
        AnimalPlace(
            animalName: "Ray",
            numberMaster: "+7-904",
            coordinate: CLLocationCoordinate2D(
                latitude: 55.731594,
                longitude: 37.418530)
        ),
        AnimalPlace(
            animalName: "Box",
            numberMaster: "+7-999",
            coordinate: CLLocationCoordinate2D(
                latitude: 37.418530,
                longitude: 55.729957)
        ),
        AnimalPlace(
            animalName: "Mysia",
            numberMaster: "+7-961",
            coordinate: CLLocationCoordinate2D(
                latitude: 33.729957,
                longitude: 37.418530)
        )
    ]
    
    private init() {}
}

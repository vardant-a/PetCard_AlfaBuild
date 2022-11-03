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
    
    var title: String? {
        if let name = animalName {
            return "Lost \(name)"
        } else { return nil }
    }
    
    var subtitle: String? {
        if let number = numberMaster {
            return "If you see him please call \(number)"
        } else { return nil }
    }
}

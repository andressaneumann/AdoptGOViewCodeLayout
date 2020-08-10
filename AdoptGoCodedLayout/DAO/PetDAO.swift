//
//  PetDAO.swift
//
//  Created by Andressa Neumann Silva on 25/07/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

class PetDAO : NSObject {
    
    func returnPets() -> Array<Pet> {
        
        let thor = Dog(breed: "Golden", gender: .male, name: "Thor", size: .medium, dateOfBirth: Date(), description: "Thor é um cão para adoção.", imagePath: "thor1", adopted: false)
        
        let dante = Dog(breed: "Sem raça definida", gender: .male, name: "Dante", size: .medium, dateOfBirth: Date(), description: "Dante é um cão para adoção.", imagePath: "dante", adopted: false)
        
        let annie = Dog(breed: "Border", gender: .female, name: "Annie", size: .large, dateOfBirth: Date(), description: "Annie é uma cadela para adoção.", imagePath: "annie", adopted: false)
        
        let nino = Dog(breed: "Dachshund", gender: .male, name: "Nino", size: .small, dateOfBirth: Date(), description: "Nino é um cão para adoção.", imagePath: "dachs", adopted: false)
        
        let billy = Dog(breed: "SRD", gender: .male, name: "Billy", size: .medium, dateOfBirth: Date(), description: "Billy é um cão para adoção.", imagePath: "lilo1", adopted: false)
        
        let aladin = Cat(breed: "Persa", gender: .male, name: "Aladin", size: .medium, dateOfBirth: Date(), description: "Billy é um gato para adoção.", imagePath: "aladin", adopted: false)
        
        let tom = Cat(breed: "Siames", gender: .male, name: "Tom", size: .medium, dateOfBirth: Date(), description: "Tom é um gato para adoção.", imagePath: "tom", adopted: false)
        
        return [thor, dante, aladin, annie, tom, nino, billy]
    }
}

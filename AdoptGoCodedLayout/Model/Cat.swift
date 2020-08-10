//
//  Cat.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

struct Cat {
    var breed: String
    var gender: PetGender
    var name: String
    var size: PetSize
    var dateOfBirth: Date
    var description: String
    var imagePath: String
    var adopted: Bool
}
extension Cat: Pet {
    
}

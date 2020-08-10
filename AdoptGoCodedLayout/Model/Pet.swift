//
//  Pet.swift
//  AdoptGoCodedLayout
//
//  Created by Andressa Neumann Silva on 10/08/20.
//  Copyright © 2020 Andressa Neumann Silva. All rights reserved.
//

import UIKit

enum PetGender: String {
    case male = "♂"
    case female = "♀"
}

enum PetSize: String {
    case small = "Pequeno"
    case medium = "Médio"
    case large = "Grande"
}

protocol Pet {
    var breed: String {get}
    var name: String {get}
    var gender: PetGender {get}
    var size: PetSize {get}
    var dateOfBirth: Date {get}
    var description: String {get}
    var imagePath: String {get}
    var adopted: Bool {get}
}

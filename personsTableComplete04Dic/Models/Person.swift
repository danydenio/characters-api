//
//  Person.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation
import UIKit

enum TypesOfEducationDegrees: String, EnumCollection {
    case associate = "Associate degree", bachelors = "Bachelor's degree", masters = "Master's degree", doctoral = "Doctor's degree"
}

class Person {
    var firstName: String
    var lastName: String
    var avatar: UIImage
    var age: Int
    var address: String
    var socialSecurityNumber: Int
    var occupation: String
    var educationDegree: TypesOfEducationDegrees
    
    init(firstName: String, lastName: String, avatar: UIImage, age: Int, address: String, socialSecurityNumber: Int, occupation: String, educationDegreee: TypesOfEducationDegrees) {
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.age = age
        self.address = address
        self.socialSecurityNumber = socialSecurityNumber
        self.occupation = occupation
        self.educationDegree = educationDegreee
    }
}

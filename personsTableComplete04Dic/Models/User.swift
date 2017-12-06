//
//  User.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/5/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import Foundation
//enum gender {
//    case male,
//}
class User {
    var name: String?
    var height: String?
    var mass: String?
    var skinColor: String?
    var hairColor: String?
    var eyeColor: String?
    var created: String?
    
    init(name: String, height: String, mass: String, skinColor: String, hairColor: String, eyeColor: String, created: String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.skinColor = skinColor
        self.hairColor = hairColor
        self.eyeColor = eyeColor
        self.created = created
    }
    init(){}
    static func parseIntoArray(JSONArray: [String: Any]) -> [User] {
        var parsedArray: [User] = []
        if let arrayResults = JSONArray["results"] as? [Any] {
            for item in arrayResults {
                if let dictionaryPerson = item as? [String: Any] {
                    let person = User()
                    person.name = dictionaryPerson["name"] as? String
                    person.height = dictionaryPerson["height"] as? String
                    person.mass = dictionaryPerson["mass"] as? String
                    person.eyeColor = dictionaryPerson["eye_color"] as? String
                    person.skinColor = dictionaryPerson["skin_color"] as? String
                    person.hairColor = dictionaryPerson["hair_color"] as? String
                    person.created = dictionaryPerson["created"] as? String
                    parsedArray.append(person)
                }
            }
        }
        return parsedArray
    }
}



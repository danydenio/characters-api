//
//  PersonViewController.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    var person: Person?
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelOccupation: UILabel!
    @IBOutlet weak var labelEducationDegree: UILabel!
    @IBOutlet weak var labelSocialSecurity: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let obj = person {
            imageAvatar.image = obj.avatar
            labelName.text = obj.firstName + " " + obj.lastName
            labelAge.text = "\(obj.age)"
            labelOccupation.text = obj.occupation
            labelEducationDegree.text = obj.educationDegree.rawValue
            labelSocialSecurity.text = "\(obj.socialSecurityNumber)"
            labelAddress.text = obj.address
        }
    }
}

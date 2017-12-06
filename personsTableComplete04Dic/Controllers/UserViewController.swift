//
//  UserViewViewController.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/5/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var labelMass: UILabel!
    @IBOutlet weak var labelSkinColor: UILabel!
    @IBOutlet weak var labelHairColor: UILabel!
    @IBOutlet weak var labelEyesColor: UILabel!
    @IBOutlet weak var labelCreatedDate: UILabel!
    var user: User?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user != nil {
            imageView.image = #imageLiteral(resourceName: "default")
            labelName.text = user?.name
            labelHeight.text = user?.height
            labelMass.text = user?.mass
            labelSkinColor.text = user?.skinColor
            labelHairColor.text = user?.hairColor
            labelEyesColor.text = user?.eyeColor
            labelCreatedDate.text = user?.created            
        }
    }



}

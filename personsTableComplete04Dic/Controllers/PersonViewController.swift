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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

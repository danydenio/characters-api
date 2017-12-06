//
//  CreateUserViewController.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/6/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldHeight: UITextField!
    @IBOutlet weak var textFieldMass: UITextField!
    @IBOutlet weak var textFieldSkinColor: UITextField!
    @IBOutlet weak var textFieldHairColor: UITextField!
    @IBOutlet weak var textFieldEyesColor: UITextField!
    @IBOutlet weak var labelDate: UILabel!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDate.text = Date().toString(dateFormat: "yyyy-MMM-dd")
        initialSetupToolbar()
    }
    func initialSetupToolbar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(buttonSavePressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonCancelPressed))
    }
    @IBAction func buttonSavePressed(_ sender: UIButton) {

        guard let name = textFieldName.text, !name.isEmpty else { return }
        user = User(name: name, height: textFieldHeight.text != "" ? textFieldHeight.text! : "uknown", mass: textFieldMass.text != "" ? textFieldMass.text! : "uknown", skinColor: textFieldSkinColor.text != "" ? textFieldSkinColor.text! : "uknown", hairColor: textFieldHairColor.text != "" ? textFieldHairColor.text! : "uknown", eyeColor: textFieldEyesColor.text != "" ? textFieldEyesColor.text! : "uknown", created: Date().toString(dateFormat: "yyyy/MMM/dd HH:mm:ss"))
        performSegue(withIdentifier: segueIdentifiers.unwindSegueCreateUserIdentifier, sender: nil)
    }
    @IBAction func buttonCancelPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    


}

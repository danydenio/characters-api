//
//  CreatePersonViewController.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import UIKit

class CreatePersonViewController: UIViewController {
    var person: Person?
    
    @IBOutlet weak var txtFieldName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldOccupation: UITextField!
    @IBOutlet weak var txtFieldEducationDegree: UITextField!
    @IBOutlet weak var txtFieldSocialSecurity: UITextField!
    @IBOutlet weak var txtFieldAge: UITextField!
    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet var txtFields: [UITextField]!
    var arrayEducationDegrees: [Any] = []
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetupToolbar()
        txtFieldEducationDegree.inputView = pickerView
        pickerView.delegate = self
        arrayEducationDegrees = TypesOfEducationDegrees.allValues
        for button in txtFields {
            button.setBottomBorder()
            //button.setLeftPaddingPoints(20)
            //button.setRightPaddingPoints(20)
        }
        
        
    }
    func initialSetupToolbar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(buttonSavePressed))
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonCancelPressed))
    }
    @IBAction func buttonSavePressed(_ sender: UIButton) {
        guard let name = txtFieldName.text, let lastName = txtFieldLastName.text, let occupation = txtFieldOccupation.text, let educationDegree = (arrayEducationDegrees[pickerView.selectedRow(inComponent: 0)] as? TypesOfEducationDegrees), let socialSecurity = txtFieldSocialSecurity.text, let socialSecurityInt = Int(socialSecurity), let address = txtFieldAddress.text, let age = txtFieldAge.text, let ageInt = Int(age) else {            
            return
        }
        person = Person(firstName: name, lastName: lastName, avatar: #imageLiteral(resourceName: "default"), age: ageInt, address: address, socialSecurityNumber: socialSecurityInt, occupation: occupation, educationDegreee: educationDegree)
        performSegue(withIdentifier: segueIdentifiers.unwindSegueCreatePersonIdentifier, sender: nil)
    }
    @IBAction func buttonCancelPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func textFieldsEndEditing(_ sender: UITextField) {
        validateFields()
    }
    @IBAction func txtFieldsTypeCharacter(_ sender: UITextField) {
        validateFields()
    }
    @IBAction func txtFieldsEditChanged(_ sender: UITextField) {
        validateFields()
    }
    func validateFields() {
        if txtFieldName.text != "" && txtFieldLastName.text != "" && txtFieldOccupation.text != "" && txtFieldSocialSecurity.text != "" && txtFieldAddress.text != "" && txtFieldEducationDegree.text != "" && txtFieldAge.text != "" {
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
    
}
// MARK: - UITableViewDataSource

extension CreatePersonViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (arrayEducationDegrees[row] as? TypesOfEducationDegrees)?.rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtFieldEducationDegree.text = (arrayEducationDegrees[row] as? TypesOfEducationDegrees)?.rawValue
    }
}
// MARK: - UIPickerViewDataSource
extension CreatePersonViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayEducationDegrees.count
    }
    
}


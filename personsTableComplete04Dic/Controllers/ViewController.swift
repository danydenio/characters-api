//
//  ViewController.swift
//  personsTableComplete04Dic
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 Daniel. All rights reserved.
//

import UIKit
struct segueIdentifiers {
    static let personIdentifier = "personSegueIdentifier"
    static let createPersonIdentifier = "createPersonSeguieIdentifier"
    static let unwindSegueCreatePersonIdentifier = "unwindSegueCreatePersonIdentifier"
}
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var personsArray: [Person] = []
    var editable = false
    var deleteBarrButtomItem: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateTable()
        initialTableSetup()
        toolbarSetup()
        resetNavigationBarButtons()
    }
    fileprivate func initialTableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelectionDuringEditing = true
        tableView.isEditing = editable
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.register(UINib(nibName: PersonTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: PersonTableViewCell.nibName)        
    }
    fileprivate func toolbarSetup() {
        deleteBarrButtomItem = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deletePerson))
        if let deleteBarrButtomItem = deleteBarrButtomItem {
            deleteBarrButtomItem.isEnabled = false
            let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            toolbarItems = [spacer, deleteBarrButtomItem]
        }
    }
    fileprivate func populateTable() {
        personsArray.append(Person(firstName: "Daniel Alejandro", lastName: "Gomez", avatar: #imageLiteral(resourceName: "avatarman1"), age: 22, address: "100 Grayson PL Decatur GE", socialSecurityNumber: 182937391, occupation: "Software Developer", educationDegreee: TypesOfEducationDegrees.bachelors))
        personsArray.append(Person(firstName: "Karina", lastName: "Gonzales", avatar: #imageLiteral(resourceName: "avatarwomen1"), age: 27, address: "8231 Neples St, Orlando FL", socialSecurityNumber: 2121212, occupation: "Marketing Manager", educationDegreee: TypesOfEducationDegrees.bachelors))
        personsArray.append(Person(firstName: "Christian", lastName: "Brown", avatar: #imageLiteral(resourceName: "avatarmen3"), age: 33, address: "0202 Lopson Hg, Dallas TX", socialSecurityNumber: 78213678, occupation: "Senor iOS Developer", educationDegreee: TypesOfEducationDegrees.bachelors))
        personsArray.append(Person(firstName: "Anderson", lastName: "Blue", avatar: #imageLiteral(resourceName: "avatarmen3"), age: 19, address: "32 Nuez St, Laredo TX.", socialSecurityNumber: 128712, occupation: "Nurse", educationDegreee: TypesOfEducationDegrees.bachelors))
        personsArray.append(Person(firstName: "Luis", lastName: "Lopez", avatar: #imageLiteral(resourceName: "avatarmen3"), age: 33, address: "22 Vento St, Plano TX.", socialSecurityNumber: 178238712, occupation: "Uber CEO", educationDegreee: TypesOfEducationDegrees.doctoral))
        personsArray.append(Person(firstName: "Edwin", lastName: "Ponce", avatar: #imageLiteral(resourceName: "avatarmen2"), age: 29, address: "999 Pones St, San Antonio TX.", socialSecurityNumber: 138712, occupation: "Web Developer", educationDegreee: TypesOfEducationDegrees.associate))
        personsArray.append(Person(firstName: "Rita", lastName: "Lane", avatar: #imageLiteral(resourceName: "avatarwomen2"), age: 22, address: "983 Southwest Ln, Atlanta GE.", socialSecurityNumber: 1827638712, occupation: "Marketing Manager", educationDegreee: TypesOfEducationDegrees.bachelors))
        personsArray.append(Person(firstName: "Abigail", lastName: "Camacho", avatar: #imageLiteral(resourceName: "avatarwomen3"), age: 40, address: "111 Bee Creek Ln, San Fransico, CA.", socialSecurityNumber: 1212122, occupation: "Uber", educationDegreee: TypesOfEducationDegrees.associate))
    }
    fileprivate func resetNavigationBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(btnCreatePersonPressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(btnEditPersonPressed))
    }
    @IBAction func btnCreatePersonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentifiers.createPersonIdentifier, sender: nil)
    }
    @IBAction func btnEditPersonPressed(_ sender: UIButton) {
        editable = editable ? false : true
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(btnCancelEditPressed))
        tableView.setEditing(editable, animated: true)
        navigationController?.setToolbarHidden(!editable, animated: true)
        
    }
    @IBAction func btnCancelEditPressed(_ sender: UIButton) {
        editable = editable ? false : true
        resetNavigationBarButtons()
        tableView.setEditing(editable, animated: true)
        navigationController?.setToolbarHidden(!editable, animated: true)
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !editable {
            performSegue(withIdentifier: segueIdentifiers.personIdentifier, sender: nil)
        } else {
            if let selectedRows = tableView.indexPathsForSelectedRows?.count {
                if selectedRows > 0 {
                    deleteBarrButtomItem?.isEnabled = true
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if editable {
            if tableView.indexPathsForSelectedRows == nil {
                deleteBarrButtomItem?.isEnabled = false
            }
        }
    }
}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsArray.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.nibName, for: indexPath) as? PersonTableViewCell {
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor(hue: 160/360, saturation: 5/100, brightness: 86/100, alpha: 1.0)
            } else {
                cell.backgroundColor = UIColor(red: 212/255, green: 216/255, blue: 216/255, alpha: 1.0) /* #d4d8d8 */

            }
            
            cell.binModel(ModelEntity: personsArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

//-- MARK Delete

extension ViewController {
    @objc func deletePerson(_ sender: UIButton) {
        if let arrayDelete = tableView.indexPathsForSelectedRows?.sorted(by: >) {
            for item in arrayDelete {
                personsArray.remove(at: item.row)
            }
            tableView.deleteRows(at: arrayDelete, with: .automatic)
        }
    }
}
// MARK: - Segue Section
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifiers.personIdentifier {
            if let nextViewController = segue.destination as? PersonViewController, let indexRow = tableView.indexPathForSelectedRow?.row {
                nextViewController.person = personsArray[indexRow]
            }
        }
    }
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        if let source = sender.source as? CreatePersonViewController {
            if let person = source.person {
                personsArray.append(person)
                tableView.reloadData()
            }
        }
    }
    
}

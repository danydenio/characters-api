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
    static let userSegueIdentifier = "userSegueIdentifier"
    static let createUserSegueIdentifier = "createUserSegueIdentifier"
    static let unwindSegueCreateUserIdentifier = "unwindSegueCreateUserIdentifier"
}
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var usersArray: [User] = []
    var editable = false
    var deleteBarrButtomItem: UIBarButtonItem?
    var networkRequests: [Any?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialTableSetup()
        toolbarSetup()
        resetNavigationBarButtons()
        let networkManager = NetworkManager()
        networkRequests.append(networkManager)
        networkManager.delegate = self
        networkManager.downloadRequest(URLString: "https://swapi.co/api/people/")
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
    fileprivate func resetNavigationBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(btnCreatePersonPressed))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(btnEditPersonPressed))
    }
    @IBAction func btnCreatePersonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdentifiers.createUserSegueIdentifier, sender: nil)
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
            performSegue(withIdentifier: segueIdentifiers.userSegueIdentifier, sender: nil)
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
        return usersArray.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.nibName, for: indexPath) as? PersonTableViewCell {
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor(hue: 160/360, saturation: 5/100, brightness: 86/100, alpha: 1.0)
            } else {
                cell.backgroundColor = UIColor(red: 212/255, green: 216/255, blue: 216/255, alpha: 1.0) /* #d4d8d8 */
            }
            cell.binModel(ModelEntity: usersArray[indexPath.row])
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
                usersArray.remove(at: item.row)
            }
            tableView.deleteRows(at: arrayDelete, with: .automatic)
        }
    }
}
// MARK: - Segue Section
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifiers.userSegueIdentifier {
            if let nextViewController = segue.destination as? UserViewController, let indexRow = tableView.indexPathForSelectedRow?.row {
                nextViewController.user = usersArray[indexRow]
            }
        }
    }
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        if let source = sender.source as? CreateUserViewController {
            if let user = source.user {
                usersArray.append(user)
                tableView.reloadData()
                let indexPathR = IndexPath.init(row: usersArray.count-1, section: 0)
                tableView.scrollToRow(at: indexPathR, at: .bottom, animated: true)
            }
        }
    }
    
}
// MARK: - UITableViewDataSource
extension ViewController: NetoworkManagerDelegate {
    func didDownloadParsedRequest(requestArray: [Any]) {
        if let array = requestArray as? [User] {
            usersArray += array
            tableView.reloadData()
        }
    }
}

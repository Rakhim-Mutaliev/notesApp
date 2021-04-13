//
//  StartViewController.swift
//  Note
//
//  Created by Макбук Про on 09.04.2021.
//

import UIKit
import RealmSwift

class StartViewController: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewSection: UIButton!
    var noteList: Results<NoteList>!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        setupUI()
        noteList = StorageManager.shared.realm.objects(NoteList.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addNewSectionTapped(_ sender: UIButton) {
        showAlert()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        addNewSection.layer.cornerRadius = 35
    }
}

extension StartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        let notes = noteList[indexPath.row]
        cell.textLabel?.text = notes.folderName
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let notesList = noteList[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, _) in
            StorageManager.shared.delete(noteList: notesList)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (_, _, _) in
            self.showAlert(with: notesList) {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        editAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [editAction, deleteAction])
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let notes = noteList[indexPath.row]
//        let vc = NotesViewController()
//        vc.folderName = notes.folderName
//    }
}

extension StartViewController {
    
    private func showAlert(with noteList: NoteList? = nil, completion: (() -> Void)? = nil) {
        
        let title = noteList != nil ? "Edit List" : "New List"
        
        let alert = AlertController(title: title, message: "Please insert new value", preferredStyle: .alert)
        
        alert.action(with: noteList) { newValue in
            
            if let noteList = noteList, let completion = completion {
                StorageManager.shared.edit(noteList: noteList, newFolder: newValue)
                completion()
            } else {
                let noteList = NoteList()
                noteList.folderName = newValue
                
                StorageManager.shared.save(noteList: noteList)
                let rowIndex = IndexPath(row: self.noteList.count - 1, section: 0)
                self.tableView.insertRows(at: [rowIndex], with: .automatic)
            }
        }
        
        present(alert, animated: true)
    }
    
}

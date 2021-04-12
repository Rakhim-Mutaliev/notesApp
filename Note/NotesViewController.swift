//
//  NotesViewController.swift
//  Note
//
//  Created by Макбук Про on 10.04.2021.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController {

    @IBOutlet weak var noteTableView: UITableView!
    @IBOutlet weak var addNewNote: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTableView.delegate = self
        setupUI()
    }
    
    private func setupUI() {
        addNewNote.layer.cornerRadius = 35
    }

}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        
        cell.textLabel?.text = "Заметка \(indexPath.row)"
        
        return cell
    }

}

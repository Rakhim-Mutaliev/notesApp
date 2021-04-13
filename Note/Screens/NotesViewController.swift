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
    var folderName: String = "Second"
    var noteList: NoteList!
    var notes: Results<Note>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTableView.delegate = self
        setupUI()
        notes = noteList.notes.first
    }
    
    private func setupUI() {
        addNewNote.layer.cornerRadius = 35
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        let note = notes[indexPath.row]
        cell.textLabel?.text = note.title
        return cell
    }
}

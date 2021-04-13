//
//  CreationNoteViewController.swift
//  Note
//
//  Created by Макбук Про on 11.04.2021.
//

import UIKit
import RealmSwift

class CreationNoteViewController: UIViewController {
    
    @IBOutlet weak var saveNoteButton: UIButton!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var noteText: UITextView!
    var noteList: NoteList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        if titleTextField.text != "" && noteText.text != "" {
            let newNote = Note(value: ["title": titleTextField.text, "text": noteText.text])
            StorageManager.shared.save(note: newNote)
            dismiss(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
    
    private func setupUI() {
        saveNoteButton.layer.cornerRadius = 20
    }
}

//
//  AlertController.swift
//  Note
//
//  Created by Ibragim Akaev on 12/04/2021.
//

import UIKit

class AlertController: UIAlertController {
    
    var doneButton = "Save"
        
    func action(with noteList: NoteList?, completion: @escaping (String) -> Void) {
        
        if noteList != nil {
            doneButton = "Update"
        }
                
        let saveAction = UIAlertAction(title: doneButton, style: .default) { _ in
            guard let newValue = self.textFields?.first?.text else { return }
            guard !newValue.isEmpty else { return }
            completion(newValue)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        addTextField { textField in
            textField.placeholder = "List Name"
            textField.text = noteList?.folderName
        }
    }
    
    func action(with note: Note?, completion: @escaping (String, String) -> Void) {
        
        if note != nil {
            doneButton = "Update"
        }
                        
        let saveAction = UIAlertAction(title: doneButton, style: .default) { _ in
            guard let newTask = self.textFields?.first?.text else { return }
            guard !newTask.isEmpty else { return }
            
            if let note = self.textFields?.last?.text, !note.isEmpty {
                completion(newTask, note)
            } else {
                completion(newTask, "")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        
        addTextField { textField in
            textField.placeholder = "New task"
            textField.text = note?.title
        }
        
        addTextField { textField in
            textField.placeholder = "Note"
            textField.text = note?.text
        }
    }
}

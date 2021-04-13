//
//  StorageManager.swift
//  Note
//
//  Created by Макбук Про on 11.04.2021.
//

import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    func save(noteList: NoteList) {
        write {
            realm.add(noteList)
        }
    }
    
    func save(note: Note) {
        write {
            realm.add(note)
        }
    }
    
    func delete(noteList: NoteList) {
        write {
            let notes = noteList.notes
            realm.delete(notes)
            realm.delete(noteList)
        }
    }
    
    func delete(task: Note) {
        write {
            realm.delete(task)
        }
    }
    
    func edit(noteList: NoteList, newFolder: String) {
        write {
            noteList.folderName = newFolder
        }
    }
    
    func edit(note: Note, title: String, text: String) {
        write {
            note.title = title
            note.text = text
        }
    }
    
    private func write(_ completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error)
        }
    }
}

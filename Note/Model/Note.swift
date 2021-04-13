//
//  Note.swift
//  Note
//
//  Created by Макбук Про on 11.04.2021.
//

import RealmSwift

class Note: Object {
    @objc dynamic var title = ""
    @objc dynamic var text = ""
}

class NoteList: Object {
    @objc dynamic var folderName = ""
    let notes = List<Note>()
}

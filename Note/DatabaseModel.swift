//
//  DatabaseModel.swift
//  Note
//
//  Created by Макбук Про on 11.04.2021.
//

import RealmSwift

class SectionList: Object {
    @objc dynamic var nameSection = ""
}

class NoteList: Object {
    @objc dynamic var nameNote = ""
    let noteLists = List<SectionList>()
}

class Note: NoteList {
    @objc dynamic var labelNote = ""
    @objc dynamic var textNote = ""
    let notes = List<NoteList>()
}

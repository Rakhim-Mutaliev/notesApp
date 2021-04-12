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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    private func setupUI() {
        saveNoteButton.layer.cornerRadius = 20
    }

}

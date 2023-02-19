//
//  FirebaseService.swift
//  Notes_App
//
//  Created by Anders Strøm on 14/02/2023.
//

import Foundation
import Firebase

class FirebaseService{
    private var db = Firestore.firestore() // holds the database object
    private let notesColl = "notes"
    var notes = [Note]()
    
    
    
    func addNote(title: String, text: String) {
        let doc = db.collection(notesColl).document() // creates a new empty document
        var data = [String:String]() // creates a new empty dictionary
        data["title"] = title
        data["text"] = text
        doc.setData(data) // saves to Firestore
    }

    
    
    func startListener(){
        db.collection(notesColl).addSnapshotListener { snap, error in
            if let e = error {
                print("some error loading \(e)")
            }else {
                if let snap = snap {
                    self.notes.removeAll()
                    for doc in snap.documents{
                        if let txt = doc.data()["text"] as? String{
                            print(txt)
                            let note = Note(title: doc.documentID, text: txt)
                            self.notes.append(note)
                        }
                    }
                }
            }
        }
    }
    
    

}

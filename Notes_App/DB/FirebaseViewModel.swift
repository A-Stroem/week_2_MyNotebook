//
//  FirebaseViewModel.swift
//  Notes_App
//
//  Created by Anders Strøm on 27/02/2023.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit

class FirebaseViewModel: ObservableObject {
    private var db = Firestore.firestore()
    private var storage = Storage.storage()
    private let collection = "notes"
    @Published var notes = [Note]()
    
    func downloadImage(forNote note: Note) {
        guard let imageURL = note.imageURL else {
            return
        }
        
        let imageRef = storage.reference(forURL: imageURL)
        imageRef.getData(maxSize: 5000000) { data, error in
            if let error = error {
                print("Error downloading image: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                note.image = UIImage(data: data)
            }
        }
    }
    
    func uploadImage(forNote note: Note, image: UIImage) {
        let data = image.pngData()!
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        let imageName = UUID().uuidString + ".png"
        let ref = storage.reference().child(imageName)
        ref.putData(data, metadata: metaData) { _, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    return
                }
                
                if let url = url {
                    note.imageURL = url.absoluteString
                    self.updateNoteImageURL(note)
                }
            }
        }
    }
    
    func addItem(text: String) {
        let doc = db.collection(collection).document()
        let data = [
            "title": "",
            "text": text,
            "imageURL": ""
        ]
        doc.setData(data)
    }
    
    func startListener() {
        db.collection(collection).addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            self.notes = snapshot.documents.compactMap { document in
                guard let data = document.data(),
                      let title = data["title"] as? String,
                      let text = data["text"] as? String else {
                    return nil
                }
                
                let note = Note(
                    id: document.documentID,
                    title: title,
                    text: text,
                    imageURL: data["imageURL"] as? String,
                    image: nil
                )
                
                if let imageURL = note.imageURL {
                    self.downloadImage(forNote: note)
                }
                
                return note
            }
        }
    }
    
    func updateNoteImageURL(_ note: Note) {
        db.collection(collection).document(note.id).updateData([
            "imageURL": note.imageURL ?? ""
        ])
    }
}


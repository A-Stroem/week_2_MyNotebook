//
//  NoteDetailView.swift
//  Notes_App
//
//  Created by Anders Strøm on 27/02/2023.
//


import SwiftUI

struct NoteDetailView: View {
    
    @Binding var note: Note
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack {
            if let image = note.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            
            Button(action: {
                isImagePickerPresented = true
            }, label: {
                if note.image == nil {
                    Text("Add Image")
                } else {
                    Text("Change Image")
                }
            })
            .padding()
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePickerView(selectedImage: $note.image)
            }
            
            TextEditor(text: $note.text)
                .padding()
        }
        .navigationTitle(note.title)
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let note = Note(id: "1", title: "Note Title", text: "Note Text", imageURL: nil, image: nil)
        return NoteDetailView(note: .constant(note))
    }
}


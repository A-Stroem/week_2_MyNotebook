//
//  NoteDetailView.swift
//  Notes_App
//
//  Created by Anders Strøm on 13/02/2023.
//

import SwiftUI


struct NoteDetailView: View {
    @State var note: Note
    var store: NotesStore
    var fService = FirebaseService()
    
    var body: some View {
        VStack {
            TextField("Title", text: $note.title)
                .padding(.all)
            TextField("Text", text: $note.text)
                .padding(.all)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .onDisappear {
            for index in 0..<self.store.notes.count {
                if self.store.notes[index].id == self.note.id {
                    self.store.notes[index] = self.note
                    self.store.saveNotes()
                    self.fService.addNote(title: self.note.title, text: self.note.text)
                    break
                }
            }
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: Note(title: "", text: ""),store: NotesStore())
    }
}

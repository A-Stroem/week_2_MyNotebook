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
    
    var body: some View {
        VStack {
            TextField("Title", text: $note.title)
            TextField("Text", text: $note.text)
        }
        .onDisappear {
            for index in 0..<self.store.notes.count {
                if self.store.notes[index].id == self.note.id {
                    self.store.notes[index] = self.note
                    self.store.saveNotes()
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

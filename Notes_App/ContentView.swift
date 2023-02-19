//
//  ContentView.swift
//  Notes_App
//
//  Created by Anders Strøm on 13/02/2023.
//

import SwiftUI

// Define the structure of a single note, with a unique identifier and title/text fields
struct Note: Codable, Identifiable {
    var id = UUID()
    var title: String
    var text: String
}


struct ContentView: View {
    @ObservedObject var store = NotesStore()
    
    var fService = FirebaseService()
    
    
    var body: some View {
        // NavigationView to provide a list of notes, each of which can be navigated to for editing
        NavigationView {
            List {
                // ForEach to display each note in the list
                ForEach(store.notes) { note in
                    // NavigationLink to navigate to the NoteDetailView for editing the note
                    NavigationLink(destination: NoteDetailView(note: note, store: self.store)) {
                        Text(note.title)
                    }
                }
                // onDelete to delete notes from the list by removing them from the notes array
                .onDelete { indices in
                    indices.forEach { self.store.notes.remove(at: $0) }
                }
            }
            .onAppear(){
                fService.startListener()
            }
            // NavigationBarTitle to display the title of the screen
            .navigationBarTitle("Notes")
            // NavigationBarItems to add the edit and add buttons to the navigation bar
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.store.addNote(title: "", text: "")
                
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

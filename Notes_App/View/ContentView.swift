//
//  ContentView.swift
//  Notes_App
//
//  Created by Anders Strøm on 27/02/2023.
//


import SwiftUI

struct ContentView: View {
    
    @ObservedObject var demoFirebase = FirebaseViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                List($demoFirebase.notes){ $note in
                    NavigationLink(destination: NoteDetailView(note: $note)) {
                        NoteRowView(note: $note)
                    }
                }
                .navigationBarTitle("Notes")
                .navigationBarItems(trailing: Button(action: {
                    demoFirebase.addItem(text: "")
                }, label: {
                    Image(systemName: "plus")
                }))
            }
        }
        .onAppear(){
            demoFirebase.startListener()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

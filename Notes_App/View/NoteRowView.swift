//
//  NoteRowView.swift
//  Notes_App
//
//  Created by Anders Strøm on 27/02/2023.
//


import SwiftUI

struct NoteRowView: View {
    
    @Binding var note: Note
    
    var body: some View {
        HStack {
            if let imageURL = note.imageURL {
                AsyncImage(url: URL(string: imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)
            }
            
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                Text(note.text)
                    .font(.subheadline)
            }
        }
    }
}

struct NoteRowView_Previews: PreviewProvider {
    static var previews: some View {
        NoteRowView(note: <#Binding<Note>#>)
    }
}

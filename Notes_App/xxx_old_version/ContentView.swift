////
////  ContentView.swift
////  Notes_App
////
////  Created by Anders Strøm on 13/02/2023.
////
//
//import SwiftUI
//
//
//struct ContentView: View {
//
//    @ObservedObject var demoFirebase = FirebaseDemo()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List($demoFirebase.notes) { $note in
//                    HStack {
//                        if let imageURL = note.imageURL {
//                            AsyncImage(url: URL(string: imageURL)) { image in
//                                image
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                            } placeholder: {
//                                ProgressView()
//                            }
//                            .frame(width: 50, height: 50)
//                            .padding(.trailing, 10)
//                        }
//
//                        VStack(alignment: .leading) {
//                            Text(note.text)
//                                .font(.headline)
//                            Text(note.id)
//                                .font(.subheadline)
//                        }
//                    }
//                }
//            }
//        }
//        .onAppear {
//            demoFirebase.startListener()
//        }
//        .navigationBarTitle("Notes")
//        .navigationBarItems(
//            leading: EditButton(),
//            trailing: Button(action: {
//                demoFirebase.addItem(text: "")
//            }, label: {
//                Image(systemName: "plus")
//            })
//        )
//    }
//}
//
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

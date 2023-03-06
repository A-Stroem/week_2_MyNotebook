//
//  ContentView.swift
//  SwiftUIImages
//
//  Created by Jon Eikholm on 25/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented:Bool = false
    @State var isPresented2:Bool = false
    @State var inputImage:UIImage?
    @State var imageToDisplay:Image = Image(systemName: "phone")
    var body: some View {
        NavigationView{
            VStack{
                ListDemo()
//                self.imageToDisplay.resizable()
//                    .frame(width: 300, height: 300, alignment: .center)
//                Button(action: {
//                    self.isPresented = true
//                }, label: {
//                    Text("Hent Billede")
//                })
//                Button(action: {
//                    self.isPresented2 = true
//                }, label: {
//                    Text("Vis Detail")
//                })
            }
//        }.sheet(isPresented: self.$isPresented, onDismiss: self.handleImage, content: {
//            MyImagePicker(image: self.$inputImage, isPresented: self.$isPresented)
//        }).sheet(isPresented: $isPresented2) {
//            SomeDetailView()
        }
    }
    func handleImage() {
        // få det valgte billede vist- Gør det selv !
        if let img = inputImage {
            print("fandt et billede")
            self.imageToDisplay = Image(uiImage: img) // oprettet et Image ud fra UIImage
        }else {
            print("fandt intet billede i bibliotek")
        }
    }
}


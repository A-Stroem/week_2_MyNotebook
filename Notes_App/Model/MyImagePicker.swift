//
//  MyImagePicker.swift
//  SwiftUIImages
//
//  Created by Jon Eikholm on 25/09/2020.
//

import SwiftUI

struct MyImagePicker : UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var isPresented:Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MyImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController() // indbygget funktionalitet i iOS som henter billede
        picker.allowsEditing = true
        // fra camera eller bibliotek
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController:UIImagePickerController, context:  UIViewControllerRepresentableContext<MyImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: MyImagePicker
        init(_ parent: MyImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.editedImage] as? UIImage {
                print("uiImage OK")
                parent.image = uiImage
            }else {
                print("uiImage not OK")
            }
            parent.isPresented = false
        }
    }
    
}



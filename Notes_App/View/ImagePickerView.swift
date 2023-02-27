//
//  ImagePickerView.swift
//  Notes_App
//
//  Created by Anders Strøm on 27/02/2023.
//


import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = context.coordinator
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedImage: $selectedImage)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        @Binding var selectedImage: UIImage?
        
        init(selectedImage: Binding<UIImage?>) {
            _selectedImage = selectedImage
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage {
                selectedImage = selectedImageFromPicker
            }
            
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}


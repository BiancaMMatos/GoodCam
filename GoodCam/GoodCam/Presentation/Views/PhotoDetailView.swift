//
//  PhotoDetailView.swift
//  GoodCam
//
//  Created by Bianca Maciel on 15/01/26.
//

import SwiftUI

struct PhotoDetailView: View {
    
    let photo: PhotoAsset
    
    var body: some View {
        ZStack {
            Color(.green)
                .ignoresSafeArea()
            
            Image(uiImage: photo.image)
                .resizable()
                .scaledToFit()
                .padding()
        }
        .navigationTitle("Photo")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PhotoDetailView(photo: PhotoAsset.mockedPhotos[0])
}

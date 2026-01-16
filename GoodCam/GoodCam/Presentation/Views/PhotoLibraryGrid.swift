//
//  PhotoLibraryGrid.swift
//  GoodCam
//
//  Created by Bianca Maciel on 15/01/26.
//

import SwiftUI

struct PhotoLibraryGrid: View {
    
    let photos: [PhotoAsset]
    
    private let columns = [
        GridItem(.adaptive(minimum: 300, maximum: 300), spacing: 8.0)
    ]
    
    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 100), spacing: 8)],
            spacing: 8
        ) {
            ForEach(photos) { photo in
                Image(uiImage: photo.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipped()
            }
        }
        .padding()
    }
}

#Preview {
    PhotoLibraryGrid(photos: PhotoAsset.mockedPhotos)
}

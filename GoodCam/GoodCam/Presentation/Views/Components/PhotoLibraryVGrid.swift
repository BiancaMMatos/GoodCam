//
//  PhotoLibraryVGrid.swift
//  GoodCam
//
//  Created by Bianca Maciel on 15/01/26.
//

import SwiftUI

struct PhotoLibraryVGrid: View {
    
    let photos: [PhotoAsset]
    let onSelect: (PhotoAsset) -> Void
    
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 8)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(photos) { photo in
                Image(uiImage: photo.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipped()
                    .onTapGesture {
                        onSelect(photo)
                    }
            }
        }
        .padding()
    }
}

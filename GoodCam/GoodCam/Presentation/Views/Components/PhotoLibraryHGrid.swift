//
//  PhotoLibraryHGrid.swift
//  GoodCam
//
//  Created by Bianca Maciel on 20/01/26.
//

import SwiftUI

struct PhotoLibraryHGrid: View {

    let photos: [PhotoAsset]
    let onSelect: (PhotoAsset) -> Void

    private let rows = [
        GridItem(.fixed(100), spacing: 8)
    ]

    var body: some View {
        ZStack {
            
            Color(.red)
                .ignoresSafeArea()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 8) {
                    ForEach(photos) { photo in
                        Image(uiImage: photo.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .onTapGesture {
                                onSelect(photo)
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

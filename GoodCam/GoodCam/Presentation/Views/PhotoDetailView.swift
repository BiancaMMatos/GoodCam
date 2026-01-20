//
//  PhotoDetailView.swift
//  GoodCam
//
//  Created by Bianca Maciel on 15/01/26.
//

import SwiftUI

struct PhotoDetailView: View {

    @StateObject private var viewModel: PhotoDetailViewModel
    @ObservedObject var libraryVM: PhotoLibraryViewModel

    init(photo: PhotoAsset, libraryVM: PhotoLibraryViewModel) {
        _viewModel = StateObject(wrappedValue: PhotoDetailViewModel(photo: photo))
        self.libraryVM = libraryVM
    }

    var body: some View {
        ZStack {
            
            Color(.green).ignoresSafeArea()
            
            VStack {
                Image(uiImage: viewModel.displayedImage)
                    .resizable()
                    .scaledToFit()
                    .padding()

                PhotoLibraryHGrid(
                    photos: libraryVM.photos,
                    onSelect: { selected in
                        viewModel.displayedImage = selected.image
                    }
                )
                .frame(height: 120)
            }
            .navigationTitle("Photo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

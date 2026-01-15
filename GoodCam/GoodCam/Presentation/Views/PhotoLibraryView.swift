//
//  PhotoLibraryView.swift
//  GoodCam
//
//  Created by Bianca Maciel on 30/11/25.
//

import SwiftUI

struct PhotoLibraryView: View {
    @StateObject var viewModel: PhotoLibraryViewModel

    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()

            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 100), spacing: 8)],
                    spacing: 8
                ) {
                    ForEach(viewModel.photos) { photo in
                        Image(uiImage: photo.image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 100)
                            .clipped()
                    }
                }
                .padding()
            }
        }
        .task {
            await viewModel.load()
        }
    }
}


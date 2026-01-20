//
//  PhotoLibraryView.swift
//  GoodCam
//
//  Created by Bianca Maciel on 30/11/25.
//

import SwiftUI

struct PhotoLibraryView: View {
    @StateObject var viewModel: PhotoLibraryViewModel
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color(.blue)
                    .ignoresSafeArea()

                ScrollView {
                    PhotoLibraryVGrid(photos: viewModel.photos, onSelect: { photo in
                        path.append(PhotoRouter.photoDetail(photo))
                    })
                    .padding(10)
                }
            }
            .navigationTitle("Library")
            .navigationDestination(for: PhotoRouter.self) { route in
                switch route {
                case .photoDetail(let photo):
                    PhotoDetailView(photo: photo, libraryVM: viewModel)
                }
            }
        }
        .task {
            if viewModel.photos.isEmpty {
                await viewModel.load()
            }
        }
    }
}

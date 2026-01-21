//
//  PhotoLibraryView.swift
//  GoodCam
//
//  Created by Bianca Maciel on 30/11/25.
//

import SwiftUI

struct PhotoLibraryView: View {
    let filtersService: FiltersService
    @State private var path = NavigationPath()
    @StateObject var viewModel: PhotoLibraryViewModel
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color(.library)
                    .ignoresSafeArea()
                
                ScrollView {
                    PhotoLibraryVGrid(photos: viewModel.photos, onSelect: { photo in
                        path.append(PhotoRouter.photoDetail(photo))
                    })
                    .padding(10)
                }
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.4)
                }
            }
            .navigationTitle("Library")
            .navigationDestination(for: PhotoRouter.self) { route in
                switch route {
                case .photoDetail(let photo):
                    PhotoDetailView(photo: photo, filtersService: filtersService, libraryVM: viewModel)
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

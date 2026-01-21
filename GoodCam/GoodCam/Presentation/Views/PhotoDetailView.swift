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
    
    init(photo: PhotoAsset, filtersService: FiltersService, libraryVM: PhotoLibraryViewModel) {
        _viewModel = StateObject(
            wrappedValue: PhotoDetailViewModel(
                photo: photo,
                filtersService: filtersService
            )
        )
        self.libraryVM = libraryVM
    }
    
    var body: some View {
        ZStack {
            Color(.systemGreen).ignoresSafeArea()
            
            VStack {
                Image(uiImage: viewModel.displayedImage)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 15.0)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.availableFilters, id: \.name) { filter in
                            Button {
                                viewModel.apply(filter: filter)
                            } label: {
                                Text(filter.name)
                                    .font(.caption)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 6)
                                    .background(Color(.secondarySystemBackground))
                                    .clipShape(Capsule())
                            }
                            .buttonStyle(.plain)
                        }
                        
                        Button("Reset") {
                            viewModel.reset()
                        }
                        .font(.caption)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(.secondarySystemBackground))
                        .clipShape(Capsule())
                    }
                    .padding(.horizontal)
                }
                
                PhotoLibraryHGrid(
                    photos: libraryVM.photos,
                    onSelect: { selected in
                        viewModel.select(photo: selected)
                    }
                    
                )
                .frame(height: 120)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.savePhoto()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .alert("Photo saved successfully!", isPresented: $viewModel.showSaveSuccess) {
                Button("OK", role: .cancel) {}
            }

            .alert("Failed to save photo.", isPresented: $viewModel.showSaveError) {
                Button("OK", role: .cancel) {}
            }
            .navigationTitle("Photo")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

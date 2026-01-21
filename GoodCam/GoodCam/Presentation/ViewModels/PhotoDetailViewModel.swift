//
//  PhotoDetailViewModel.swift
//  GoodCam
//
//  Created by Bianca Maciel on 20/01/26.
//

import UIKit
import Photos
import Combine

@MainActor
final class PhotoDetailViewModel: ObservableObject {
    
    @Published var displayedImage: UIImage
    @Published private(set) var originalImage: UIImage
    
    @Published var showSaveError = false
    @Published var showSaveSuccess = false
    
    let availableFilters: [CIFilter]
    private let filtersService: FiltersService
    
    init(photo: PhotoAsset, filtersService: FiltersService) {
        self.originalImage = photo.image
        self.displayedImage = photo.image
        self.filtersService = filtersService
        self.availableFilters = FiltersService.all()
    }
    
    func select(photo: PhotoAsset) {
        originalImage = photo.image
        displayedImage = photo.image
    }
    
    func apply(filter: CIFilter) {
        displayedImage = filtersService.apply(
            filter: filter,
            to: originalImage
        )
    }
    
    func reset() {
        displayedImage = originalImage
    }
    
    func saveImageToPhotoLibrary(_ image: UIImage) async throws {
        try await PHPhotoLibrary.shared().performChanges {
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }
    }
    
    func savePhoto() {
        Task {
            do {
                try await saveImageToPhotoLibrary(displayedImage)
                showSaveSuccess = true
                
            } catch {
                showSaveError = true
            }
        }
        
    }
}

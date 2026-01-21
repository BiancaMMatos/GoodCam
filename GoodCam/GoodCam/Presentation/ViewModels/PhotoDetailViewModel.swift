//
//  PhotoDetailViewModel.swift
//  GoodCam
//
//  Created by Bianca Maciel on 20/01/26.
//

import UIKit
import Combine

@MainActor
final class PhotoDetailViewModel: ObservableObject {

    @Published private(set) var originalImage: UIImage
    @Published var displayedImage: UIImage

    private let filtersService: FiltersService
    let availableFilters: [CIFilter]

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
}

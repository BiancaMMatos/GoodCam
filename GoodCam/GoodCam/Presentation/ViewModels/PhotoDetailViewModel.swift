//
//  PhotoDetailViewModel.swift
//  GoodCam
//
//  Created by Bianca Maciel on 20/01/26.
//

import SwiftUI
import Combine

@MainActor
final class PhotoDetailViewModel: ObservableObject {

    let originalPhoto: PhotoAsset

    @Published var displayedImage: UIImage

    init(photo: PhotoAsset) {
        self.originalPhoto = photo
        self.displayedImage = photo.image
    }
}

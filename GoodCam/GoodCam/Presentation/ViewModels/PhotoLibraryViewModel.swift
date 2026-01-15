//
//  PhotoLibraryViewModel.swift
//  GoodCam
//
//  Created by Bianca Maciel on 14/01/26.
//

import Combine


final class PhotoLibraryViewModel: ObservableObject {
    @Published var photos: [PhotoAsset]
    
    init(photos: [PhotoAsset]) {
        self.photos = photos
    }
}

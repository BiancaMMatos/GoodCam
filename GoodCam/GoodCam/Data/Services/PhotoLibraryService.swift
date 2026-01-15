//
//  PhotoLibraryService.swift
//  GoodCam
//
//  Created by Bianca Maciel on 13/01/26.
//

import Foundation

/// Using real photos
final class PhotoLibraryService: PhotoLibraryServiceProtocol {
    func fetchPhotos() async throws -> [PhotoAsset] {
        return PhotoAsset.mockedPhotos
    }
  
}

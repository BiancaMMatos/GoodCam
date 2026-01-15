//
//  MockPhotoLibraryService.swift
//  GoodCam
//
//  Created by Bianca Maciel on 14/01/26.
//

import Foundation

/// Using mocked data
final class MockPhotoLibraryService: PhotoLibraryServiceProtocol {
    func fetchPhotos() async throws -> [PhotoAsset] {
        return PhotoAsset.mockedPhotos
    }
    
    
}

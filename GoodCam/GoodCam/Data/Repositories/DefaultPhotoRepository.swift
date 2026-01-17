//
//  DefaultPhotoRepository.swift
//  GoodCam
//
//  Created by Bianca Maciel on 14/01/26.
//

import Foundation

final class DefaultPhotoRepository: PhotoLibraryRepositoryProtocol {

    private let service: PhotoLibraryServiceProtocol

    init(service: PhotoLibraryServiceProtocol) {
        self.service = service
    }

    func getPhotos(quality: PhotoImageQuality) async throws -> [PhotoAsset] {
        do {
            return try await service.fetchPhotos(quality: quality)
        } catch {
            print("Failed to fetch photos")
            return PhotoAsset.mockedPhotos
        }
    }
}


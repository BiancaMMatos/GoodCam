//
//  FetchPhotoUseCase.swift
//  GoodCam
//
//  Created by Bianca Maciel on 14/01/26.
//

import Foundation


final class FetchPhotoUseCase: FetchPhotosUseCaseProtocol {

    private let repository: PhotoLibraryRepositoryProtocol

    init(repository: PhotoLibraryRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [PhotoAsset] {
        try await repository.getPhotos(
            quality: .thumbnail
        )
    }
}


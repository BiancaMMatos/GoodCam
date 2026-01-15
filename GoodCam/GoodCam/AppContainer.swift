//
//  AppContainer.swift
//  GoodCam
//
//  Created by Bianca Maciel on 15/01/26.
//


final class AppContainer {

    // MARK: - Services
    let photoLibraryService: PhotoLibraryServiceProtocol

    // MARK: - Repositories
    let photoLibraryRepository: PhotoLibraryRepositoryProtocol

    // MARK: - UseCases
    let fetchPhotoUseCase: FetchPhotosUseCaseProtocol

    init() {
        // Mocks
        self.photoLibraryService = PhotoLibraryService()

        self.photoLibraryRepository = DefaultPhotoRepository(
            service: photoLibraryService
        )

        self.fetchPhotoUseCase = FetchPhotoUseCase(
            repository: photoLibraryRepository
        )
    }
}

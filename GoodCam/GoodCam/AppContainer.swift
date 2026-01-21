//
//  AppContainer.swift
//  GoodCam
//
//  Created by Bianca Maciel on 15/01/26.
//


import CoreImage
import UIKit

final class AppContainer {

    // MARK: - Services
    let photoLibraryService: PhotoLibraryServiceProtocol
    let filtersService: FiltersService

    // MARK: - Repositories
    let photoLibraryRepository: PhotoLibraryRepositoryProtocol

    // MARK: - UseCases
    let fetchPhotoUseCase: FetchPhotosUseCaseProtocol

    init() {
        
        // Service
        self.photoLibraryService = PhotoLibraryService()
        self.filtersService = FiltersService(
            context: CIContext()
        )

        // Repository
        self.photoLibraryRepository = DefaultPhotoRepository(
            service: photoLibraryService
        )

        // UseCase
        self.fetchPhotoUseCase = FetchPhotoUseCase(
            repository: photoLibraryRepository
        )
    }
}

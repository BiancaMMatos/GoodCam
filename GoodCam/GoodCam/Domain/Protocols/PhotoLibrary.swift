//
//  PhotoLibrary.swift
//  GoodCam
//
//  Created by Bianca Maciel on 13/01/26.
//


// MARK: - UseCase
/// Define an user action or business logic
protocol FetchPhotosUseCaseProtocol {
    func execute() async -> [PhotoAsset]
}


// MARK: - Repository
/// Define how the domain get the photos doesn't matter from which source
protocol PhotoLibraryRepositoryProtocol {
    func getPhotos() async -> [PhotoAsset]
}


// MARK: - Service
/// Define how the system get the photos from an external source
protocol PhotoLibraryServiceProtocol {
    func fetchPhotos() async throws -> [PhotoAsset]
}

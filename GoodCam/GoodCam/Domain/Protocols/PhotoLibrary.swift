//
//  PhotoLibrary.swift
//  GoodCam
//
//  Created by Bianca Maciel on 13/01/26.
//

import UIKit
import Photos

// MARK: - UseCases
/// Represents a user action / business rule
protocol FetchPhotosUseCaseProtocol {
    func execute() async throws -> [PhotoAsset]
}

protocol FetchSinglePhotoUseCaseProtocol {
    func execute(id: String) async throws -> PhotoAsset
}

// MARK: - Repository
/// Defines how the domain accesses photos (source-agnostic)
protocol PhotoLibraryRepositoryProtocol {
    func getPhotos(quality: PhotoImageQuality) async throws -> [PhotoAsset]
}

// MARK: - Service
/// Defines how photos are fetched from an external system
protocol PhotoLibraryServiceProtocol {
    func fetchPhotos(quality: PhotoImageQuality) async throws -> [PhotoAsset]
}


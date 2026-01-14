//
//  PhotoLibrary.swift
//  GoodCam
//
//  Created by Bianca Maciel on 13/01/26.
//

import Photos


protocol PhotoLibraryServiceProtocol {
    func fetchPhotos() async throws -> [PhotoAsset]
}

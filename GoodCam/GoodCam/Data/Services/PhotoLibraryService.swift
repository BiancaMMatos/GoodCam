//
//  PhotoLibraryService.swift
//  GoodCam
//
//  Created by Bianca Maciel on 13/01/26.
//

import UIKit
import Photos

/// Using real photos
final class PhotoLibraryService: PhotoLibraryServiceProtocol {

    func fetchPhotos(quality: PhotoImageQuality) async throws -> [PhotoAsset] {

        /// Ask for permission
        let status = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        guard status == .authorized || status == .limited else { return [] }

        /// Search for assets
        let options = PHFetchOptions()
        options.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]

        let results = PHAsset.fetchAssets(with: .image, options: options)

        /// Convert to UIImage
        let scale = UIScreen().scale
        
        return await withCheckedContinuation { continuation in
            var photos: [PhotoAsset] = []

            let manager = PHImageManager.default()
            let requestOptions = PHImageRequestOptions()
            requestOptions.deliveryMode = .highQualityFormat
            requestOptions.resizeMode = .fast
            requestOptions.isSynchronous = true

            results.enumerateObjects { asset, _, _ in
                manager.requestImage(
                    for: asset,
                    targetSize: quality == .thumbnail
                        ? CGSize(width: 300 * scale, height: 300 * scale)
                        : PHImageManagerMaximumSize,
                    contentMode: .aspectFill,
                    options: requestOptions
                ) { image, _ in
                    if let image {
                        photos.append(
                            PhotoAsset(
                                id: asset.localIdentifier,
                                image: image
                            )
                        )
                    }
                }
            }

            continuation.resume(returning: photos)
        }
    }
}

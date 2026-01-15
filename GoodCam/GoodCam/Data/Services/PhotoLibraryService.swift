//
//  PhotoLibraryService.swift
//  GoodCam
//
//  Created by Bianca Maciel on 13/01/26.
//

import Photos

/// Using real photos
final class PhotoLibraryService: PhotoLibraryServiceProtocol {
    func fetchPhotos() async throws -> [PhotoAsset] {
        /// Ask for permission
        let status = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
        
        guard status == .authorized || status == .limited else {
            return []
        }
        
        /// Search for assets
        let options = PHFetchOptions()
        options.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        
        let results = PHAsset.fetchAssets(with: .image, options: options)
        
        /// Convert to UIImage
        return await withCheckedContinuation { continuation in
            var photos: [PhotoAsset] = []
            
            let manager = PHImageManager.default()
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = true
            requestOptions.deliveryMode = .fastFormat
            
            results.enumerateObjects { asset, _, _ in
                manager.requestImage(for: asset,
                                     targetSize: .init(width: 300, height: 300),
                                     contentMode: .aspectFill,
                                     options: requestOptions) { image, _ in
                    if let image {
                        photos.append(PhotoAsset(id: asset.localIdentifier, image: image))
                    }
                }
            }
            continuation.resume(returning: photos)
        }
    }
}

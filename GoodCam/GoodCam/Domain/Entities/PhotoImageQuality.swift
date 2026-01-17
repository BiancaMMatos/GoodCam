//
//  PhotoImageQuality.swift
//  GoodCam
//
//  Created by Bianca Maciel on 16/01/26.
//

import Photos

enum PhotoImageQuality {
    case thumbnail
    case fullResolution

    var targetSize: CGSize {
        switch self {
        case .thumbnail:
            return CGSize(width: 300, height: 300)
            
        case .fullResolution:
            return PHImageManagerMaximumSize
        }
    }

    var deliveryMode: PHImageRequestOptionsDeliveryMode {
        switch self {
        case .thumbnail:
            return .fastFormat
        case .fullResolution:
            return .highQualityFormat
        }
    }
}


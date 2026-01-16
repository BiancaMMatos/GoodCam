//
//  PhotoAsset.swift
//  GoodCam
//
//  Created by Bianca Maciel on 13/01/26.
//

import UIKit

struct PhotoAsset: Identifiable, Hashable {
    let id: String
    let image: UIImage
    
    
    static let mockedPhotos: [PhotoAsset] = [
        PhotoAsset(id: "0", image: UIImage(systemName: "square.and.arrow.up.circle")!),
        PhotoAsset(id: "1", image: UIImage(systemName: "square.and.arrow.up.badge.clock")!),
        PhotoAsset(id: "2", image: UIImage(systemName: "square.and.arrow.down.badge.xmark.fill")!),
    ]
}




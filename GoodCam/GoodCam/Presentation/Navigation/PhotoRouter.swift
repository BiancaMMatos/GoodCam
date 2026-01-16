//
//  PhotoRouter.swift
//  GoodCam
//
//  Created by Bianca Maciel on 15/01/26.
//

import Foundation

enum PhotoRouter: Hashable {
    case photoDetail(PhotoAsset)
}

/// Hashable --> allows a type to generate a consistent hash value, enabling equality checks and use in hash-based collections like `Set` and `Dictionary`.


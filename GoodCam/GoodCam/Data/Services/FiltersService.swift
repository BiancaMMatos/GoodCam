//
//  FiltersService.swift
//  GoodCam
//
//  Created by Bianca Maciel on 20/01/26.
//

import UIKit
import CoreImage

final class FiltersService {

    private let context: CIContext

    init(context: CIContext = CIContext()) {
        self.context = context
    }

    static func all() -> [CIFilter] {
        
        // blur
        let blurFilter = CIFilter(name: "CIGaussianBlur")!
        blurFilter.setValue(5.0, forKey: kCIInputRadiusKey)

        // halftone
        let halftoneFilter = CIFilter(name: "CICMYKHalftone")!
        halftoneFilter.setValue(5.0, forKey: kCIInputWidthKey)

        // crystallize
        let crystallizeFilter = CIFilter(name: "CICrystallize")!
        crystallizeFilter.setValue(5.0, forKey: kCIInputRadiusKey)

        // monochrome
        let monochromeFilter = CIFilter(name: "CIColorMonochrome")!
        monochromeFilter.setValue(
            CIColor(red: 0.7, green: 0.7, blue: 0.7),
            forKey: kCIInputColorKey
        )
        monochromeFilter.setValue(1.0, forKey: kCIInputIntensityKey)

        // sepia
        let sepiaFilter = CIFilter(name: "CISepiaTone")!
        sepiaFilter.setValue(1.0, forKey: kCIInputIntensityKey)

        return [blurFilter, halftoneFilter, crystallizeFilter, monochromeFilter, sepiaFilter]
    }

    func apply(filter: CIFilter, to image: UIImage) -> UIImage {
        guard let ciImage = CIImage(image: image) else {
            return image
        }

        filter.setValue(ciImage, forKey: kCIInputImageKey)

        guard
            let output = filter.outputImage,
            let cgImage = context.createCGImage(
                output,
                from: output.extent
            )
        else {
            return image
        }

        return UIImage(cgImage: cgImage)
    }
}

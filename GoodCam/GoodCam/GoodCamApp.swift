//
//  GoodCamApp.swift
//  GoodCam
//
//  Created by Bianca Maciel on 30/11/25.
//

import SwiftUI

@main
struct GoodCamApp: App {

    private let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            PhotoLibraryView(
                filtersService: container.filtersService, viewModel: PhotoLibraryViewModel(
                    fetchPhotosUseCase: container.fetchPhotoUseCase
                )
            )
        }
    }
}


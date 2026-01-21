//
//  PhotoLibraryViewModel.swift
//  GoodCam
//
//  Created by Bianca Maciel on 14/01/26.
//

import Combine


final class PhotoLibraryViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var photos: [PhotoAsset] = []
    private var fetchPhotosUseCase: FetchPhotosUseCaseProtocol
    
    init(fetchPhotosUseCase: FetchPhotosUseCaseProtocol) {
        self.fetchPhotosUseCase = fetchPhotosUseCase
    }
    
    func load() async {
        
        isLoading = true
        defer { isLoading = false }
        
        do {
            photos = try await fetchPhotosUseCase.execute()
        } catch {
            print("Error loading the photos")
        }
        
    }
}

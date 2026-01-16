//
//  PhotoLibraryView.swift
//  GoodCam
//
//  Created by Bianca Maciel on 30/11/25.
//

import SwiftUI

struct PhotoLibraryView: View {
    @StateObject var viewModel: PhotoLibraryViewModel

    var body: some View {
        ZStack {
            Color(.blue)
                .ignoresSafeArea()

            ScrollView {
                PhotoLibraryGrid(photos: viewModel.photos)
            }
        }
        .task {
            await viewModel.load()
        }
    }
}

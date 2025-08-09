//
//  testdansmultiproApp.swift
//  testdansmultipro
//
//  Created by PT Siaga Abdi Utama on 09/08/25.
//

import SwiftUI
import Data
import Core

@main
struct testdansmultiproApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = FeedRepositoryImpl(apiClient: APIClient(baseURL: "https://picsum.photos/"))
            FeedTabView(repository: repository)

        }
    }
}


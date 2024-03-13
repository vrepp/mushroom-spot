//
//  ContentView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct RootView: View {
    private let loginViewModel = LoginViewModel()
    private let homeViewModel = HomeViewModel()

    var body: some View {
        if let authToken = AppSession.shared.authToken {
            let httpClient = HttpClient(authToken: authToken)
            let profileService = ProfileService(client: httpClient)
            let mushroomService = MushroomService(client: httpClient)
            let homeViewModel = HomeViewModel(profileService: profileService, mushroomService: mushroomService)

            HomeView(viewModel: homeViewModel)
        } else {
            LoginView(viewModel: loginViewModel)
        }
    }
}

#Preview {
    RootView()
}

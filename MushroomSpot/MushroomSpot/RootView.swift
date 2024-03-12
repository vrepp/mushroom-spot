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
        if !loginViewModel.isLoggedIn {
            LoginView(viewModel: loginViewModel)
        } else {
            HomeView(viewModel: homeViewModel)
        }
    }
}

#Preview {
    RootView()
}

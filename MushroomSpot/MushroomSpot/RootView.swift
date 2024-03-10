//
//  ContentView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct RootView: View {
    private let loginViewModel = LoginViewModel()

    var body: some View {
        LoginView(viewModel: loginViewModel)
    }
}

#Preview {
    RootView()
}

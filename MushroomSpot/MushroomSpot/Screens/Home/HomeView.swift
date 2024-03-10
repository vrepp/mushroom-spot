//
//  HomeView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            List {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Profile") {}
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

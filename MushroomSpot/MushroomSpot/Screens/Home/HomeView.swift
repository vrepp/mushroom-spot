//
//  HomeView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct HomeView: View {
    @State var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.mushrooms, id: \.id) { mushroom in
                NavigationLink(
                   destination: MushroomDetailsView(mushroom: mushroom)) {
                       MushroomListRowView(mushroom: mushroom)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Profile") {
                        Task { await viewModel.showProfile() }
                    }
                }
            }
            .sheet(isPresented: $viewModel.profileIsPresented, content: {
                if let profile = viewModel.profile {
                    ProfileView(profile: profile)
                }
            })
        }.task {
            await viewModel.refreshList()
        }
    }
}

#Preview {
    HomeView()
}

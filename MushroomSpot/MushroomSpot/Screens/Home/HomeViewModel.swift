//
//  HomeViewModel.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 11.03.2024..
//

import Observation

@Observable
class HomeViewModel {
    private(set) var profile: Profile?
    private(set) var mushrooms: [Mushroom] = []

    var profileIsPresented = false

    private let profileService: ProfileServiceProtocol
    private let mushroomService: MushroomServiceProtocol

    init(profileService: ProfileServiceProtocol = ProfileService(), mushroomService: MushroomServiceProtocol = MushroomService()) {
        self.profileService = profileService
        self.mushroomService = mushroomService
    }

    @MainActor
    func showProfile() async {
        guard profile == nil else {
            profileIsPresented = true
            return
        }

        do {
            profile = try await profileService.fetch()
            profileIsPresented = true
        } catch {
            print("Profile fetch error: \(error.localizedDescription)")
            // TODO: show error
        }
    }

    @MainActor
    func refreshList() async {
        do {
            mushrooms = try await mushroomService.fetch()
        } catch {
            print("Mushtooms fetch error: \(error.localizedDescription)")
            // TODO: show error
        }
        mushrooms = Mushroom.mockList
    }
}

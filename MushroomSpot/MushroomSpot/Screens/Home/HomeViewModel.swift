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

    func showProfile() {
        guard profile == nil else {
            profileIsPresented = true
            return
        }

        // TODO: fetch Profile; show modal
    }

    func refreshList() {
        // TODO: fetch Mushroom list

        mushrooms = Mushroom.mockList
    }
}

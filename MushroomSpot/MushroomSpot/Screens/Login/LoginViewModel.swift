//
//  LoginViewModel.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import Observation

@Observable
class LoginViewModel {
    var email = ""
    var password = ""

    var isLoggedIn = false

    func logIn() {
        // TODO: call login request
        isLoggedIn = true
    }
}

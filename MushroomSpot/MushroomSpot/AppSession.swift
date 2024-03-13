//
//  AppSession.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 13.03.2024..
//

import Foundation

@Observable
class AppSession {
    static let shared = AppSession()

    private(set) var authToken: String?

    private init() {}

    func logIn(with authToken: String) {
        self.authToken = authToken
    }

    func logOut() {
        self.authToken = nil
    }
}

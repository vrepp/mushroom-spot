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

    private let loginService: LoginServiceProtocol

    init(loginService: LoginServiceProtocol = LoginService()) {
        self.loginService = loginService
    }

    @MainActor
    func logIn() async {
        guard AppSession.shared.authToken == nil else { return }

        do {
            let authToken = try await loginService.login(email: email, password: password)
            AppSession.shared.logIn(with: authToken)
        } catch {
            print("Login error: \(error.localizedDescription)")
            // TODO: show error
        }
    }
}

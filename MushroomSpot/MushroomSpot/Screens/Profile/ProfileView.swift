//
//  ProfileView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct ProfileView: View {
    let profile: Profile

    var body: some View {
        VStack (alignment: .center) {
            VStack (alignment: .leading) {
                ProfileFieldView(name: "Username:", value: profile.username)
                    .padding(.top)

                ProfileFieldView(name: "First name:", value: profile.firstName)
                    .padding(.top)

                ProfileFieldView(name: "First name:", value: profile.lastName)
                    .padding(.top)
            }.padding(Constants.padding)

            Spacer()

            HStack {
                Button(action: { AppSession.shared.logOut() }) {
                    Text("Sign out")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: Constants.buttonHeight)
                }.buttonStyle(.borderedProminent)
            }.padding(Constants.padding)
        }
    }
}

extension ProfileView {
    enum Constants {
        static let padding = 20.0
        static let buttonHeight = 30.0
    }
}

#Preview {
    ProfileView(profile: Profile.mock!)
}

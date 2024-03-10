//
//  ProfileView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack (alignment: .center) {
            VStack (alignment: .leading) {
                ProfileFieldView(name: "Username:", value: "<USERNAME>")
                    .padding(.top)

                ProfileFieldView(name: "First name:", value: "<FIRSTNAME>")
                    .padding(.top)

                ProfileFieldView(name: "First name:", value: "<LASTNAME>")
                    .padding(.top)
            }.padding(Constants.padding)

            Spacer()

            HStack {
                Button(action: {}) {
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
    ProfileView()
}

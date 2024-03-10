//
//  LoginView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct LoginView: View {
    @State var viewModel: LoginViewModel

    var body: some View {
        VStack (alignment: .center) {
            Image(.mushroom)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(Constants.padding)

            Text("Mushroom Spot")
                .font(.largeTitle)
        }

        VStack(alignment: .leading) {
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.roundedBorder)
                .padding(.top, Constants.padding)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .padding(.top, Constants.padding)
        }.padding(Constants.padding)

        HStack {
            Button(action: {}) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: Constants.buttonHeight)
            }.buttonStyle(.borderedProminent)
        }.padding(Constants.padding)

        Spacer()
    }
}

extension LoginView {
    enum Constants {
        static let padding = 20.0
        static let imagePadding = 50.0
        static let buttonHeight = 30.0
    }
}

#Preview {
    LoginView(viewModel: .init())
}

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

        ValidationFormView { isValid in
            VStack(alignment: .leading) {
                TextField("Email", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, Constants.padding)
                    .validate(item: $viewModel.email, rule: ValidationRule.email) { error in
                        Text(error)
                            .font(.callout)
                            .foregroundColor(.red)
                    }

                TextField("Password", text: $viewModel.password)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                    .padding(.top, Constants.padding)
                    .validate(item: $viewModel.email, rule: ValidationRule.password) { error in
                        Text(error)
                            .font(.callout)
                            .foregroundColor(.red)
                    }
            }
            .padding(Constants.padding)

            Spacer()

            HStack {
                Button(action: { Task { await viewModel.logIn() } }) {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: Constants.buttonHeight)
                }
                .buttonStyle(.borderedProminent)
                .disabled( !isValid() )
            }
            .padding(Constants.padding)
        }
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

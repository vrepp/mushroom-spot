//
//  ProfileFieldView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct ProfileFieldView: View {
    let name: String
    let value: String

    var body: some View {
        VStack (alignment: .leading) {
            Text(name)
                .font(.headline)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(value)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ProfileFieldView(name: "Username:", value: "some.email@email.com")
        .padding()
}

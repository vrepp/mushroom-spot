//
//  ValidationFormView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 13.03.2024..
//

import SwiftUI

struct ValidationFormView<Content: View>: View {
    @State var validationSeeds: [Bool] = []
    @ViewBuilder var content: (@escaping () -> Bool) -> Content

    var body: some View {
        content(isValid)
            .onPreferenceChange(ValidationPreferenceKey.self) { value in
                validationSeeds = value
            }
    }

    private func isValid() -> Bool {
        return validationSeeds.allSatisfy { $0 }
    }
}

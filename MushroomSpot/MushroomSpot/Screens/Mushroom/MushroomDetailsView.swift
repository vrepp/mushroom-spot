//
//  MushroomDetailsView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct MushroomDetailsView: View {
    var body: some View {
        VStack (alignment: .center) {
            Image(.mushroom)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .padding(Constants.padding)

            Text("Mushroom name")
                .font(.largeTitle)
                .padding(Constants.padding)

            Text("Mushroom latin name")
                .font(.title)
                .italic()
                .padding(Constants.padding)
        }

        Spacer()
    }
}

extension MushroomDetailsView {
    enum Constants {
        static let padding = 20.0
        static let imagePadding = 50.0
    }
}

#Preview {
    MushroomDetailsView()
}

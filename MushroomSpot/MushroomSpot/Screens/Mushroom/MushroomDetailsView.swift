//
//  MushroomDetailsView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 10.03.2024..
//

import SwiftUI

struct MushroomDetailsView: View {
    let mushroom: Mushroom

    var body: some View {
        VStack (alignment: .center) {
            AsyncImage(
                url: URL(string: mushroom.profilePicture),
                content: { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: Constants.imageHeight)
                        .padding(Constants.padding)
                },
                placeholder: {
                    ProgressView()
                }
            )

            Text(mushroom.name)
                .font(.largeTitle)
                .padding(Constants.padding)

            Text(mushroom.latinName)
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
        static let imageHeight = 300.0
        static let imagePadding = 50.0
    }
}

#Preview {
    MushroomDetailsView(mushroom: Mushroom.mockList.first!)
}

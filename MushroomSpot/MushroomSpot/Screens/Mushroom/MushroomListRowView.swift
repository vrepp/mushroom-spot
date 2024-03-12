//
//  MushroomListRowView.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import SwiftUI

struct MushroomListRowView: View {
    var mushroom: Mushroom

    var body: some View {
        HStack {
            Text(mushroom.name)

            Spacer()

            AsyncImage(
                url: URL(string: mushroom.profilePicture),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 50, maxHeight: 50)
                },
                placeholder: {
                    ProgressView()
                }
            )
        }
    }
}

#Preview {
    MushroomListRowView(mushroom: Mushroom.mockList.first!)
}

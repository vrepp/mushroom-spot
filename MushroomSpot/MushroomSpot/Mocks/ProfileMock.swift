//
//  ProfileMock.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 12.03.2024..
//

import Foundation

extension Profile {
    static let mock: Profile? = {
        guard 
            let data = Data.fromJsonFile(filename: "profile"),
            let response = try? JSONDecoder().fromSnakeCase().decode(ProfileResponse.self, from: data)
        else {
            return nil
        }
        
        return response.user
    }()
}

//
//  ValidationPreferenceKey.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 13.03.2024..
//

import SwiftUI

struct ValidationPreferenceKey: PreferenceKey {
    static var defaultValue: [Bool] = []

    static func reduce(value: inout [Bool], nextValue: () -> [Bool]) {
        value += nextValue()
    }
}

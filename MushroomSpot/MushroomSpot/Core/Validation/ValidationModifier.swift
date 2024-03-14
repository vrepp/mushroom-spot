//
//  ValidationModifier.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 13.03.2024..
//

import SwiftUI

struct ValidationModifier: ViewModifier  {
    let validation: () -> Bool
    func body(content: Content) -> some View {
        content
            .preference(key: ValidationPreferenceKey.self, value: [validation()])
        if !validation() {
            Text("Testis")
        }
    }
}

struct ValidationViewModifier<T, ErrorView: View>: ViewModifier {
    @State private var validationResult: String = ""
    @Binding private var item: T
    @ViewBuilder private let content: (String) -> ErrorView

    let rule: any Validatable<T>

    public init(
        item: Binding<T>,
        rule: any Validatable<T>,
        @ViewBuilder content: @escaping (String) -> ErrorView
    ) {
        _item = item
        self.rule = rule
        self.content = content
    }

    @ViewBuilder
    public func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
                .preference(key: ValidationPreferenceKey.self, value: [rule.isValid(item)])
                .validation($item, rule: rule) { result in
                    DispatchQueue.main.async {
                        self.validationResult = result
                    }
                }
            validationMessageView
        }
    }

    private var validationMessageView: some View {
        guard validationResult.isEmpty else {
            return AnyView(content(validationResult))
        }

        return AnyView(EmptyView())
    }
}

extension View {
//    func validate(_ flag: @escaping () -> Bool) -> some View {
//        self
//            .modifier(ValidationModifier(validation: flag))
//    }

    func validation<T>(
            _ item: Binding<T>,
            rule: any Validatable<T>,
            action: @escaping (String) -> Void
        ) -> some View {
            let result = rule.isValid(item.wrappedValue)
            action(result ? "" : rule.error)
            return self
        }

    func validate<T, ErrorView: View>(
        item: Binding<T>,
        rule: any Validatable<T>,
        @ViewBuilder content: @escaping (String) -> ErrorView
    ) -> some View {
        modifier(
            ValidationViewModifier(
                item: item,
                rule: rule,
                content: content
            )
        )
    }
}

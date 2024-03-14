//
//  Validation.swift
//  MushroomSpot
//
//  Created by Valentin Rep on 13.03.2024..
//

import Foundation

protocol Validatable<Input> {
    associatedtype Input

    var error: String { get }

    func isValid(_ input: Input) -> Bool
}

struct ValidationRule: Validatable {
    typealias Input = String

    var error: String
    var validate: () -> Bool

    func isValid(_ input: Input) -> Bool {
        validate()
    }
}

extension ValidationRule {
    static let nonEmpty = NonEmptyValidationRule(error: "Cannot be empty")
    static let email = EmailValidationRule(error: "Invalid email address")
    static let password = PasswordValidationRule(error: "Password must contain at least 8 characters, at least one number and both lower and uppercase letters and special characters")
}

struct NonEmptyValidationRule: Validatable {
    var error: String

    func isValid(_ input: String) -> Bool {
        !input.isEmpty
    }
}

struct EmailValidationRule: Validatable {
    var error: String

    func isValid(_ input: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            
        return emailPredicate.evaluate(with: input)
    }
}

struct PasswordValidationRule: Validatable {
    var error: String

    func isValid(_ input: String) -> Bool {
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
            
        return passwordPredicate.evaluate(with: input)
    }
}

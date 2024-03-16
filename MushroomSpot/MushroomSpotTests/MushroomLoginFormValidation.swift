//
//  MushroomLoginFormValidation.swift
//  MushroomSpotTests
//
//  Created by Valentin Rep on 16.03.2024..
//

import XCTest
@testable import MushroomSpot

final class MushroomLoginFormValidation: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidateEmailSuccess() {
        let validationRule = ValidationRule.email

        let email = "name.surname@email.com"

        let isValid = validationRule.isValid(email)
        XCTAssertTrue(isValid)
    }

    func testValidateEmailFailure() {
        let validationRule = ValidationRule.email

        let email = "name.surname@email"

        let isValid = validationRule.isValid(email)
        XCTAssertFalse(isValid)
    }

    func testValidatePasswordSuccess() {
        let validationRule = ValidationRule.password

        let passsword = "Test123!"

        let isValid = validationRule.isValid(passsword)
        XCTAssertTrue(isValid)
    }

    func testValidatePasswordFailure() {
        let validationRule = ValidationRule.password

        let passsword = "invalid"

        let isValid = validationRule.isValid(passsword)
        XCTAssertFalse(isValid)
    }
}

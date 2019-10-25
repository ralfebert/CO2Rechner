//
//  CO2RechnerUITests.swift
//  CO2RechnerUITests
//
//  Created by Ralf Ebert on 25.10.19.
//

import XCTest

class CO2RechnerUITests: XCTestCase {
    
    func testTypingInTextField() {
        let app = XCUIApplication()
        app.launch()

        let field1 = app.textFields["Field1"]
        field1.tap()
        field1.typeText("foo")
        
        let field2 = app.textFields["Field2"]
        field2.tap()
        field2.typeText("bar")
    }

}

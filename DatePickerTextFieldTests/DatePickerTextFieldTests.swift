//
//  DatePickerTextFieldTests.swift
//  DatePickerTextFieldTests
//
//  Created by Nestarneal on 2018/05/19.
//  Copyright © 2018年 Nestarneal. All rights reserved.
//

import XCTest
@testable import DatePickerTextField

class DatePickerTextFieldTests: XCTestCase {
    
    let datePickerTextField: DatePickerTextField? = DatePickerTextField()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialization() {
        XCTAssertNotNil(datePickerTextField)
    }
    
    func testDatePickerTextFieldDelegate() {
        XCTAssertNotNil(datePickerTextField)
        XCTAssertNil(datePickerTextField!.datePickerTextFieldDelegate)
        datePickerTextField?.datePickerTextFieldDelegate = self
        XCTAssertNotNil(datePickerTextField!.datePickerTextFieldDelegate)
    }
}

extension DatePickerTextFieldTests: DatePickerTextFieldDelegate {
    
    func datePickerTextField(_ datePickerTextField: DatePickerTextField, didSelectDate date: Date) {
        print(date)
    }
}

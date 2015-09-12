//
//  TestClockTests.swift
//  TestClockTests
//
//  Created by Nicholas Devenish on 12/09/2015.
//  Copyright © 2015 Nicholas Devenish. All rights reserved.
//

import XCTest
@testable import TestClock

class TestClockTests: XCTestCase {
    func testExample() {
      let timer = Clock.createTimer()
      XCTAssert(timer.elapsed > 0)
    }
}

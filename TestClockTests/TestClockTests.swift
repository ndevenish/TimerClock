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
    func testScale() {
      let timer = Clock.createTimer()
      let value = timer.elapsed
    }
}

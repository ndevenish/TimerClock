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
      XCTAssert(Clock.timeBases.count != 0)
      NSThread.sleepForTimeInterval(5)
      Clock.frameUpdate()
      XCTAssert(timer.scale == 1)
      XCTAssert(timer.elapsed > 3)
    }
}

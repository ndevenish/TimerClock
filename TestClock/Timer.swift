//
//  Timers.swift
//  KerbalHUD
//
//  Created by Nicholas Devenish on 26/08/2015.
//  Copyright © 2015 Nicholas Devenish. All rights reserved.
//

import Foundation
import QuartzCore

public let Clock : TimerClock = TimerClock()

public class TimerClock {
  private var startTime : Double
  
  var timeBases : [String: Double] = [
  "Real": 0,
  ]
  
  init() {
    startTime = CACurrentMediaTime()
  }
  
  func createTimer() -> Timer {
    return Timer(clock: self, baseTime: timeBases["Real"]!, scale: 1)
  }
}

public struct Timer{
  let clock : TimerClock
  let baseTime : Double
  let scale : Double
  
  var elapsed : Double {
    print(scale)
    return scale*(clock.timeBases["Real"]!-baseTime)
  }
}

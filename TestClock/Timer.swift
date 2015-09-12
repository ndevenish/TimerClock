//
//  Timers.swift
//  KerbalHUD
//
//  Created by Nicholas Devenish on 26/08/2015.
//  Copyright © 2015 Nicholas Devenish. All rights reserved.
//

import Foundation
import QuartzCore

public enum TimerCategory {
  case Real
}

public let Clock : TimerClock = TimerClock()

public class TimerClock {
  var time : Double { return timeBases[.Real]! }
  var frameTime : Double = 0
  
  private var startTime : Double
  private var started : Bool = false
  
  var timeBases : [TimerCategory: Double] = [
  .Real: 0,
  ]
  
  init() {
    startTime = CACurrentMediaTime()
  }
  
  func createTimer() -> Timer {
    return Timer(clock: self, baseTime: timeBases[.Real]!,
      duration: 0, scale: 1, category: .Real)
  }
}

public struct Timer{
  let clock : TimerClock
  let baseTime : Double
  let duration : Double
  let scale : Double
  let category : TimerCategory
  
  var elapsed : Double {
    print(scale)
    return scale*(clock.timeBases[category]!-baseTime)
  }
  var remaining : Double {
    return duration - elapsed
  }
  var isDone : Bool { return remaining < 0 }
  var frameTime : Double { return clock.frameTime*scale }
  var fraction : Double { return max(0, min(elapsed / duration, 1.0)) }
}

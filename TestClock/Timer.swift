//
//  Timers.swift
//  KerbalHUD
//
//  Created by Nicholas Devenish on 26/08/2015.
//  Copyright © 2015 Nicholas Devenish. All rights reserved.
//

import Foundation
import QuartzCore

//public protocol ITimerClock {
//  /// Return a measure, in real time, of how long we have run
//  var time : Double { get }
//  /// The real-time length of the last frame
//  var frameTime : Double { get }
//  
//  /// Create a timer
//  func createTimer() -> Timer
//  
//  // Update the clock for this frame
//  func frameUpdate()
//}
//
//public protocol Timer {
//  var elapsed : Double { get }
//}

public let Clock = TimerClock()

public class TimerClock {
  var time : Double { return timeBases["Real"]! }
  var frameTime : Double = 0
  
  var startTime : Double
  var started : Bool = false
  
  var timeBases : [String: Double] = [
    "Real": 0,
  ]
  
  init() {
    startTime = CACurrentMediaTime()
  }
  
  func createTimer() -> Timer {
    return Timer(clock: self, baseTime: timeBases["Real"]!, scale: 1)
  }
  
  func frameUpdate() {
    let time = CACurrentMediaTime()
    if !started {
      frameTime = 0
      started = true
    } else {
      frameTime = time - startTime - timeBases["Real"]!
    }
    timeBases["Real"] = CACurrentMediaTime()-startTime
  }
}

public struct Timer {
  let clock : TimerClock
  let baseTime : Double
  let scale : Double

  var elapsed : Double {
    print(scale)
    return scale*(clock.timeBases["Real"]!-baseTime)
  }
}
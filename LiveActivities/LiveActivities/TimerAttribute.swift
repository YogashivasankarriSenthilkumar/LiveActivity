//
//  TimerAttribute.swift
//  LiveActivities
//
//  Created by Yogashivasankarri Senthilkumar on 23/11/23.
//

import ActivityKit
import SwiftUI

struct TimerAttribute: ActivityAttributes{
   public typealias timerStatus = ContentState

    public struct ContentState: Codable, Hashable{
        var endTime: Date
    }

    var timerName: String
}

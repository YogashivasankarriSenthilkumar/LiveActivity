//
//  ContentView.swift
//  LiveActivities
//
//  Created by Yogashivasankarri Senthilkumar on 23/11/23.
//

import ActivityKit
import SwiftUI

struct ContentView: View {
    @State private var activity: Activity<TimerAttribute>? = nil
    var body: some View {
        VStack(spacing: 16) {
            Button("Start Activity"){
                startActivity()
            }
            Button("Stop Activity"){
                stopActivity()
            }
            Button("Update Activity"){
                updateActivity()
            }
        }.buttonStyle(.borderedProminent)
            .controlSize(.large)
    }

    func startActivity(){
        let attributes = TimerAttribute(timerName: "Dummy Timer")
        let state = TimerAttribute.timerStatus(endTime: Date().addingTimeInterval(60 * 5))

        activity = try? Activity<TimerAttribute>.request(attributes: attributes, contentState: state, pushType: nil)
    }

    func stopActivity(){
        let state = TimerAttribute.timerStatus(endTime: .now)

        Task{
            await activity?.end(using: state,dismissalPolicy: .immediate)
        }
    }

    func updateActivity(){
        let state = TimerAttribute.timerStatus(endTime: Date().addingTimeInterval(60 * 10))
        Task{
            await activity?.update(using: state)
        }

    }
}

#Preview {
    ContentView()
}

//
//  Widgets.swift
//  Widgets
//
//  Created by Yogashivasankarri Senthilkumar on 23/11/23.
//

import ActivityKit
import WidgetKit
import SwiftUI


struct TimerActivityView : View {
    let context: ActivityViewContext<TimerAttribute>
    var body: some View{
        VStack{
            Text(context.attributes.timerName)
                .font(.headline)

            Text(context.state.endTime, style: .timer)
        }
        .padding(.horizontal)
    }
}

struct Widgets: Widget {

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAttribute.self) { context in
            TimerActivityView(context: context)
        } dynamicIsland: { context in
            DynamicIsland{
                DynamicIslandExpandedRegion(.center){
                    Text("Expanded View")
                }
            } compactLeading: {
                Text("CL")
            }compactTrailing: {
                Text("CT")
            }minimal: {
                Text("M")
            }
        }

    }
}


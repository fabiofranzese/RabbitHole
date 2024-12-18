//
//  HoleWidget.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import WidgetKit
import SwiftUI

@main
struct HoleWidget: Widget {
    let kind: String = "HoleWidget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: HoleProvider()) { entry in
            HoleWidgetView(entry: entry)}
            .configurationDisplayName("Today's Rabbit Hole")
            .description("Discover today's Rabbit Hole")
            .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    HoleWidget()
} timeline: {
    HoleEntry(date: .now, title: "Hole")
    HoleEntry(date: .now + 1, title: "Hole + 1")
}

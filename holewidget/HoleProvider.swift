//
//  HoleProvider.swift
//  RabbitHole
//
//  Created by Fabio on 18/12/24.
//

import WidgetKit


struct HoleProvider: TimelineProvider {
    private let placeholderEntry = HoleEntry(
        date: Date(),
        title: "Rabbit Hole Title"
    )
    
    func placeholder(in context: Context) -> HoleEntry {
        return placeholderEntry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (HoleEntry) -> ()) {
        completion(placeholderEntry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<HoleEntry>) -> Void) {
        let timeline = Timeline(entries: [HoleEntry(date: Date(), title: "Rabbit Hole Title")], policy: .never)
        completion(timeline)
    }
}

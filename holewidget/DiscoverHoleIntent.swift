//
//  DiscoverHoleIntent.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import AppIntents

struct DiscoverHoleIntent: AppIntent {
    static var title: LocalizedStringResource = "Discover Hole"
    static var description = IntentDescription("Discover today's Rabbit Hole")
    
    func perform() async throws -> some IntentResult {
        HoleTracker.shared.discover()
        return .result()
    }
}

//
//  HoleTrackers.swift
//  RabbitHole
//
//  Created by Fabio on 18/12/24.
//

//
//  HoleTracker.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import SwiftUI
import WidgetKit

class HoleTracker {
    static let shared: HoleTracker = HoleTracker()
    private let sharedDefaults: UserDefaults
    
    private init() {
        sharedDefaults = UserDefaults(suiteName: "group.holes.shared")!
    }
    
    func discover() {
        sharedDefaults.set(true, forKey: "discovered")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func discovered() -> Bool {
        return sharedDefaults.bool(forKey: "discovered")
    }
    
    func reset() {
        sharedDefaults.set(false, forKey: "discovered")
        
        WidgetCenter.shared.reloadTimelines(ofKind: "holewidgetExtension")
    }
}

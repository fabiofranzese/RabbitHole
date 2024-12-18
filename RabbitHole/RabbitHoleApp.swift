//
//  rabbitholeApp.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import SwiftUI

@main
struct rabbitholeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}

//
//  HoleWidgetView.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import WidgetKit
import SwiftUI

struct HoleWidgetView: View {
    var entry : HoleProvider.Entry
    var viewmodel = ViewModel()
    @AppStorage("discovered", store: UserDefaults(suiteName: "group.holes.shared")) var discovered = false
    let orange = Color(red: 200 / 255, green: 100 / 255, blue: 0 / 255)
    @State private var pulsate : Bool = false
    var body : some View {
        VStack{
            if HoleTracker.shared.discovered() {
                Text("Today's Rabbit\nHole is:")
                    .font(.subheadline)
                    .bold()
                    .padding()
                Text(viewmodel.holes.last!.title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(orange)
            } else {
                VStack{
                    Text("Unlock Today's")
                        .bold()
                        .multilineTextAlignment(.center)
                    Text("Rabbit Hole")
                        .bold()
                        .foregroundStyle(orange)
                    Button(intent: DiscoverHoleIntent()) {
                        Circle()
                        .frame(width: UIScreen.main.bounds.width * 0.80)
                            .scaleEffect(1.0)
                            .shadow(color: orange, radius: 10, x: 0, y: 0)
                        .foregroundStyle(RadialGradient(colors: [.yellow, orange], center: .center, startRadius: 0, endRadius: CGFloat(150)))
                        .background(.clear)
                    }
                }
            }
        }
        .containerBackground(.clear, for: .widget)
    }
}

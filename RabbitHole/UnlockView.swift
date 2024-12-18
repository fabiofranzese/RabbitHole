//
//  UnlockView.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import SwiftUI
import WidgetKit

struct UnlockView: View {
    @EnvironmentObject var viewmodel : ViewModel
    @State private var pulsate: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                VStack{Text("Unlock Today's")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 80)
                    Text("Rabbit Hole")
                        .font(.largeTitle)
                        .bold()
                }.accessibilityElement(children: .combine)
                Spacer()
                Button(action: {
                    HoleTracker.shared.discover()
                    print(HoleTracker.shared.discovered())
                }) {
                    Circle()
                    .frame(width: UIScreen.main.bounds.width * 0.60)
                        .scaleEffect(pulsate ? 1.05 : 1.0)
                        .shadow(color: viewmodel.darkOrange, radius: 10, x: 0, y: 0)
                    .foregroundStyle(RadialGradient(colors: [.yellow, viewmodel.darkOrange], center: .center, startRadius: 0, endRadius: CGFloat(150)))
                        .animation(
                            Animation.easeInOut(duration: 1).repeatForever(autoreverses: true),
                            value: pulsate
                        )
                }.onAppear {
                    pulsate.toggle()
                }
                .accessibilityLabel("Unlock Button")
                .accessibilityHint("Click this button to unlock today's rabbit hole.")
                .padding(.bottom, 80)
                Spacer()
            }
        }
        .background(Color(UIColor.systemGray6))
    }
}

#Preview {
    UnlockView()
        .environmentObject(ViewModel())
}

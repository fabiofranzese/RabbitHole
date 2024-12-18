//
//  HolesView.swift
//  rabbithole
//
//  Created by Fabio on 16/12/24.
//

import SwiftUI

struct HolesView: View {
    @EnvironmentObject var viewmodel : ViewModel
    
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(0..<viewmodel.holes.count, id: \.self) { index in
                HoleView(hole: viewmodel.holes[index])
                    .tag(index)
                    .padding(.bottom, 3)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .animation(.easeInOut, value: 1)
        .onAppear {
            selectedIndex = viewmodel.holes.count - 1
        }
        .ignoresSafeArea()
        .background(Color(UIColor.systemGray6))
    }
}

#Preview {
    HolesView()
        .environmentObject(ViewModel())
}

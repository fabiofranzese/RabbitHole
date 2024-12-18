import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewmodel : ViewModel
    @AppStorage("discovered", store: UserDefaults(suiteName: "group.holes.shared")) var discovered = false
    @AppStorage("title", store: UserDefaults(suiteName: "group.holes.shared")) var title = "Title"
    var body: some View {
        ZStack{
            HolesView()
                .opacity($discovered.wrappedValue ? 1 : 0)
                .animation(.easeInOut(duration: 1), value: viewmodel.discovered)
            UnlockView()
                .opacity($discovered.wrappedValue ? 0 : 1)
                .animation(.easeInOut(duration: 1), value: viewmodel.discovered)
        }
        .animation(
            Animation.easeInOut(duration: 1),
            value: discovered
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}

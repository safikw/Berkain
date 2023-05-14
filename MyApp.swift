import SwiftUI

@main
struct MyApp: App {
    @StateObject var batikContainer = InitialBatikContainer()
    
    var body: some Scene {
        WindowGroup {
            OnBoardView()
                .environmentObject(batikContainer)
                .preferredColorScheme(.light)
//            HomeView()
//                .environmentObject(batikContainer)
        }
    }
}

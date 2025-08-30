import SwiftUI

@main
struct iOSApp: App {
    @State private var needsLogin: Bool = false
    
    var body: some Scene {
        WindowGroup {
            CollectionsView()
                .fullScreenCover(isPresented: $needsLogin) {
                    LoginView()
                }
                .onAppear {
                    needsLogin = UserDefaults.isFirstLaunch()
                }
        }
    }
}

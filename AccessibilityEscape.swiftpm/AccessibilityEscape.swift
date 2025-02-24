import SwiftUI

@available(iOS 18.0, *)
@main
struct AccessibilityEscape: App {
    init() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
    
    @State var model = Model()
    @State var isAssistantVisible = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                TabView {
                    LevelsView()
                        .tabItem {
                            Label("Escape", systemImage: "door.left.hand.open")
                        }
                    GuideView()
                        .tabItem {
                            Label("Guide", systemImage: "books.vertical")
                        }
                }
                .tabViewStyle(.tabBarOnly)
                .environment(model)
            }
            .assistant(isVisible: $model.isAssistantVisible, assistantMessage: model.assistantMessage)
        }
    }
}

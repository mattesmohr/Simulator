import SwiftUI

@main
struct SimulatorApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .frame(width: 300, height: 200)
        }
        .windowResizability(.contentSize)
        WindowGroup("iPhone", id: "iphone", for: String.self) { $url in
            WebView(url: $url)
                .frame(width: 390, height: 844)
        }
        .windowResizability(.contentSize)
        .defaultPosition(UnitPoint(x: 0.25, y: 0.5))
        WindowGroup("iPad", id: "ipad", for: String.self) { $url in
            WebView(url: $url)
                .frame(width: 800, height: 1000)
        }
        .windowResizability(.contentSize)
        .defaultPosition(UnitPoint(x: 0.75, y: 0.5))
    }
}

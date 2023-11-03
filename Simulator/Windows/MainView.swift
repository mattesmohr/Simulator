import SwiftUI

struct MainView: View {
    
    @Environment(\.openWindow) private var openWindow
    
    @State var url: String = ""
    
    var body: some View {
        Form {
            TextField("URL", text: $url)
            Button("Abschicken") {
                openWindow(id: "iphone", value: url)
                openWindow(id: "ipad", value: url)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

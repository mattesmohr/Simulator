import SwiftUI

@main
struct SimulatorApp: App {
    
    @Environment(\.openWindow) private var openWindow
    
    @Environment(\.dismissWindow) private var dismissWindow
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var columnVisibility = NavigationSplitViewVisibility.detailOnly
    
    @StateObject var viewModel = WebViewModel()
    
    var body: some Scene {
        Window("Simulator", id: "main") {
            NavigationSplitView(columnVisibility: $columnVisibility) {
            } detail: {
                MainView(viewModel: viewModel)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    EnterField(viewModel: viewModel)
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Menu {
                        Button {
                            createiPhone(content: DeviceView(viewModel: viewModel))
                        } label: {
                            Label("iPhone (Portrait)", systemImage: "iphone.badge.play")
                                .labelStyle(.titleAndIcon)
                        }
                        Button {
                            createiPad(content: DeviceView(viewModel: viewModel), orientation: .portrait)
                            
                        } label: {
                            Label("iPad (Portrait)", systemImage: "ipad.badge.play")
                                .labelStyle(.titleAndIcon)
                        }
                        Button {
                            createiPad(content: DeviceView(viewModel: viewModel), orientation: .landscape)
                            
                        } label: {
                            Label("iPad (Landscape)", systemImage: "ipad.landscape.badge.play")
                                .labelStyle(.titleAndIcon)
                        }
                    } label: {
                        Image(systemName: "ipad.and.iphone")
                    }
                    .disabled(!viewModel.isReady)
                    Button {
                        openWindow(id: "settings")
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
        }
        .windowResizability(.contentSize)
        Window("Settings", id: "settings") {
            Form {
                Section(header: Text("Request")) {
                    Picker("Language", selection: $viewModel.acceptLanguage) {
                        Text("English")
                            .tag("en")
                        Text("English (United States)")
                            .tag("en-US")
                        Text("English (United Kingdom)")
                            .tag("en-GB")
                        Text("German")
                            .tag("de")
                        Text("German (Germany)")
                            .tag("de-DE")
                        Text("German (Austria)")
                            .tag("de-AT")
                        Text("German (Switzerland)")
                            .tag("de-CH")
                        Text("French")
                            .tag("fr")
                        Text("French (France)")
                            .tag("fr-FR")
                        Text("French (Canada)")
                            .tag("fr-CA")
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        dismissWindow(id: "settings")
                    } label: {
                        Text("Close")
                    }
                }
            }
            .padding()
        }
    }
    
    func createiPhone(content: some View) {
        
        print(#function)
        
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 414, height: 896), styleMask: [.closable, .titled], backing: .buffered, defer: false)
        window.identifier = NSUserInterfaceItemIdentifier(rawValue: "iphone")
        window.title = "iPhone"
        window.isReleasedWhenClosed = false
        window.contentView = NSHostingView(rootView: content)
        window.becomeFirstResponder()
        window.orderFrontRegardless()
        window.center()
    }
    
    func createiPad(content: some View, orientation: DeviceOrientation) {
        
        print(#function)
        
        let window = NSWindow(contentRect: orientation.dimension, styleMask: [.closable, .titled], backing: .buffered, defer: false)
        window.identifier = NSUserInterfaceItemIdentifier(rawValue: "ipad")
        window.title = "iPad"
        window.isReleasedWhenClosed = false
        window.contentView = NSHostingView(rootView: content)
        window.becomeFirstResponder()
        window.orderFrontRegardless()
        window.center()
    }
}

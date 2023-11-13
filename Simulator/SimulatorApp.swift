import SwiftUI

@main
struct SimulatorApp: App {
    
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
                    Button {
                        createiPhone(content: DeviceView(viewModel: viewModel))
                    } label: {
                        Image(systemName: "iphone.badge.play")
                    }
                    .disabled(!viewModel.isReady)
                    Button {
                        createiPad(content: DeviceView(viewModel: viewModel))
                        
                    } label: {
                        Image(systemName: "ipad.badge.play")
                    }
                    .disabled(!viewModel.isReady)
                }
            }
        }
        .windowResizability(.contentSize)
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
    
    func createiPad(content: some View) {
        
        print(#function)
        
        let window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 820, height: 1180), styleMask: [.closable, .titled], backing: .buffered, defer: false)
        window.identifier = NSUserInterfaceItemIdentifier(rawValue: "ipad")
        window.title = "iPad"
        window.isReleasedWhenClosed = false
        window.contentView = NSHostingView(rootView: content)
        window.becomeFirstResponder()
        window.orderFrontRegardless()
        window.center()
    }
}

import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        
        if let identifier = sender.identifier {
            
            if identifier.rawValue == "main" {
                NSApplication.shared.terminate(self)
            }
        }
        
        return true
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        for window in NSApplication.shared.windows {
            window.delegate = self
        }
    }
}

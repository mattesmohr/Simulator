import Foundation

enum DeviceOrientation {
    
    case portrait
    case landscape
    
    var dimension: NSRect {
        
        switch self {
        case .portrait:
            return NSRect(x: 0, y: 0, width: 820, height: 1180)
            
        case .landscape:
            return NSRect(x: 0, y: 0, width: 1180, height: 820)
        }
    }
}

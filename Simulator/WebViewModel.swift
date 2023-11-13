import Foundation
import WebKit

class WebViewModel: NSObject, ObservableObject, WKNavigationDelegate {
    
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var isReady: Bool = false
    @Published var shouldRefresh: Bool = false
    
    var address: String = ""
    
    func goBack() {
        print(#function)
    }
    
    func goForward() {
        print(#function)
    }
}

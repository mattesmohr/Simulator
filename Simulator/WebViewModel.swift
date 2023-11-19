import Foundation
import WebKit

class WebViewModel: NSObject, ObservableObject, WKNavigationDelegate {
    
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var isReady: Bool = false
    @Published var shouldRefresh: Bool = false
    @Published var acceptLanguage: String = "en-GB"
    
    var scrollPosition: Int = 0
    var address: String = ""
    
    func goBack() {
        print(#function)
    }
    
    func goForward() {
        print(#function)
    }
}

import SwiftUI
import WebKit

struct MainWebView: NSViewRepresentable {

    @ObservedObject var viewModel: WebViewModel
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(position: $viewModel.scrollPosition)
    }
    
    func makeNSView(context: Context) -> WKWebView {
        
        print(#function, self)
        
        let view = WKWebView()
        view.isInspectable = true
        view.navigationDelegate = context.coordinator
        
        return view
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        
        print(#function, self)
        
        if let url = URL(string: viewModel.address) {
            
            var request = URLRequest(url: url)
            request.setValue(viewModel.acceptLanguage, forHTTPHeaderField: "Accept-Language")
            
            nsView.load(request)
        }
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        
        var position: Binding<Int>
        
        init(position: Binding<Int>) {
            self.position = position
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
                
                webView.evaluateJavaScript("window.pageYOffset") { (value, error) in
                    
                    if let position = value as? Int {                        
                        self.position.wrappedValue = position
                    }
                }
            }
        }
    }
}

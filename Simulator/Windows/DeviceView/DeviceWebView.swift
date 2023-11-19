import SwiftUI
import WebKit

struct DeviceWebView: NSViewRepresentable {
    
    @ObservedObject var viewModel: WebViewModel
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(position: $viewModel.scrollPosition)
    }
    
    func makeNSView(context: Context) -> WKWebView {
        
        print(#function, self)
        
        let view = WKWebView()
        view.isInspectable = true
        view.navigationDelegate = context.coordinator
        
        if let url = URL(string: viewModel.address) {
            
            var request = URLRequest(url: url)
            request.setValue(viewModel.acceptLanguage, forHTTPHeaderField: "Accept-Language")
            
            view.load(request)
        }
        
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
                webView.evaluateJavaScript("window.scrollTo(0, \(self.position.wrappedValue))")
            }
        }
    }
}

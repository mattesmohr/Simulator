import SwiftUI
import WebKit

struct MainWebView: NSViewRepresentable {

    @ObservedObject var viewModel: WebViewModel
    
    func makeNSView(context: Context) -> WKWebView {
        
        print(#function, self)
        
        let view = WKWebView()
        view.isInspectable = true
        
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
}

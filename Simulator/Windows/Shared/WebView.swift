import SwiftUI
import WebKit

struct WebView: NSViewRepresentable {

    @Binding var url: String?
    
    func makeNSView(context: Context) -> WKWebView {
        
        let view = WKWebView()
        view.isInspectable = true
        
        return view
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        
        if let url = url {
         
            let request = URLRequest(url: URL(string: url)!)
            
            nsView.load(request)
        }
    }
}

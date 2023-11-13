import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: WebViewModel
    
    var body: some View {
        ZStack {
            MainWebView(viewModel: viewModel)
        }
    }
}

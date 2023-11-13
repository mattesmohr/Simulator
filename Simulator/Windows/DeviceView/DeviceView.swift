import SwiftUI

struct DeviceView: View {
    
    @ObservedObject var viewModel: WebViewModel

    var body: some View {
        ZStack {
            DeviceWebView(viewModel: viewModel)
        }
    }
}

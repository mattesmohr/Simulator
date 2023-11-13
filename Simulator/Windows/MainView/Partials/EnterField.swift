import SwiftUI

struct EnterField: View {
    
    @ObservedObject var viewModel: WebViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.goBack()
            } label: {
                Image(systemName: "chevron.left")
            }
            .buttonStyle(.plain)
            .disabled(!viewModel.canGoForward)
            Button {
                viewModel.goForward()
            } label: {
                Image(systemName: "chevron.right")
            }
            .buttonStyle(.plain)
            .disabled(!viewModel.canGoForward)
            Spacer()
            TextField("URL", text: $viewModel.address, prompt: Text("Enter website name"))
                .onSubmit {
                    viewModel.isReady.toggle()
                }
                .textFieldStyle(.plain)
            Spacer()
            Button {
                viewModel.shouldRefresh.toggle()
            } label: {
                Image(systemName: "arrow.clockwise")
            }
            .buttonStyle(.plain)
            .disabled(!viewModel.isReady)
        }
        .frame(width: 500, height: 30)
        .padding(.horizontal, 10)
        .background(Color(nsColor: .controlBackgroundColor))
        .clipShape(.rect(cornerRadius: 6))
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color(nsColor: .controlColor), lineWidth: 1)
        )
    }
}

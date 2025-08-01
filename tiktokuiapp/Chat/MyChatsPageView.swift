import SwiftUI

struct ChatsPageView: View {
    @State private var selectedUser: User? = nil
    @State private var showChat = false

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(users, id: \.id) { user in
                        Button(action: {
                            selectedUser = user
                            showChat = true
                        }) {
                            ChatCellView(user: user)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Gelen kutum")
        }
        .fullScreenCover(isPresented: $showChat) {
            if let user = selectedUser {
                ChatPageView(user: user)
            }
        }
    }
}

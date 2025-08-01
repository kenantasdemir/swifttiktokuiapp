import SwiftUI

struct FriendsPageView: View {
    @State private var searchText = ""
    
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            return users.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.email.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(filteredUsers, id: \.id) { user in
                        UserCellView(user: user)
                    }
                }
                .padding()
            }
            .searchable(text: $searchText, prompt: "Ara...")
            .navigationTitle("Arkadaşlarım")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

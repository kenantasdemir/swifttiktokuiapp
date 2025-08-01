

import SwiftUI

struct PreviewProfileView: View {
    @State private var selectedTab: ProfileTab = .uploads
    @State private var feedViewModel = FeedViewModel()
    @State internal var user:User

    var body: some View {
        NavigationStack {
            VStack(spacing: 2) {
                PreviewProfileHeaderView(user:user)
                ProfileSegmentsView(selectedTab: $selectedTab)

                TabView(selection: $selectedTab) {
                    ScrollView {
                        PostGridView(itemCount: 1)
                    }
                    .tag(ProfileTab.uploads)

                    ScrollView {
                        PostGridView(itemCount: 2)
                    }
                    .tag(ProfileTab.privatePosts)

                    ScrollView {
                        PostGridView(itemCount: 3)
                    }
                    .tag(ProfileTab.saved)

                    ScrollView {
                        PostGridView(itemCount: feedViewModel.posts.count)
                    }
                    .tag(ProfileTab.liked)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationTitle("Profil")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}




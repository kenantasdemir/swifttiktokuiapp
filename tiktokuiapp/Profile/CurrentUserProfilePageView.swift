
import SwiftUI
struct CurrentUserProfilePageView: View {
    @State private var selectedTab: ProfileTab = .uploads
    @State private var feedViewModel = FeedViewModel()
    

    var body: some View {
        NavigationStack {
            VStack(spacing: 2) {
                ProfileHeaderView()
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

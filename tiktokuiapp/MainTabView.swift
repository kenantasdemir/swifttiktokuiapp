

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedTab = 0
    @State private var selectedFeedTab:FeedTab = .forYou
    
    
    var body: some View {
        TabView {
            FeedPageView().tabItem {
                VStack {
                    Image(systemName: selectedTab == 0 ? "house.fill":"house")
                        .environment(\.symbolVariants,selectedTab == 0 ? .fill: .none)
                    Text("Home")
                }
            }
            .onAppear{ selectedTab = 0 }
            .tag(0)
             
            
           


            FriendsPageView().tabItem {
                VStack {
                    Image(systemName: selectedTab == 1 ? "person.2.fill" : "person.2")
                        .environment(\.symbolVariants,selectedTab == 1 ? .fill: .none)
                    Text("Friends")
                }
            }
            .onAppear{ selectedTab = 1 }
            .tag(1)
            
            UploadPostView().tabItem {
                VStack {
                    Image(systemName: "plus")
                   
                }
            }
            .onAppear{ selectedTab = 2 }
            .tag(2)
            
            ChatsPageView().tabItem {
                VStack {
                    Image(systemName:  selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants,selectedTab == 3 ? .fill: .none)
                    Text("Gelen kutum")
                }
            }
            .onAppear{ selectedTab = 3 }
            .tag(3)
            
            CurrentUserProfilePageView().tabItem {
                VStack {
                    Image(systemName:  selectedTab == 4 ? "person.fill":"person")
                        .environment(\.symbolVariants,selectedTab == 4 ? .fill: .none)
                    Text("Profilim")
                }
            }
            .onAppear{ selectedTab = 4 }
            .tag(4)
        }
        .tint(.black)
    }
}





import SwiftUI

struct ProfileSegmentsView: View {
    @Binding var selectedTab: ProfileTab

    var body: some View {
        HStack(spacing: 20) {
            ForEach(ProfileTab.allCases, id: \.self) { tab in
                VStack {
                    Image(systemName: iconName(for: tab)) // İkonlar isteğe bağlı
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(selectedTab == tab ? .primary : .gray)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(selectedTab == tab ? .primary : .clear)
                }
                .onTapGesture {
                    selectedTab = tab
                }
            }
        }
        .padding(.vertical, 10)

    }
    
    func iconName(for tab: ProfileTab) -> String {
        switch tab {
        case .uploads: return "square.grid.3x3.fill"
        case .privatePosts: return "lock.fill"
        case .saved: return "bookmark.fill"
        case .liked: return "heart.fill"
        }
    }

}



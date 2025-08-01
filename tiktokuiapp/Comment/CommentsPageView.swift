

import SwiftUI

struct CommentsPageView: View {
    var body: some View {
        ScrollView{
            ForEach(comments,id: \.id){ comment in
                CommentCellView(comment:comment)
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    CommentsPageView()
}

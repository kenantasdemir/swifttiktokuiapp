import SwiftUI

struct PostGridView: View {
    var itemCount: Int // dışarıdan gelecek içerik sayısı
    
    private let items = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible())
    ]
    
    private let width = (UIScreen.main.bounds.width / 3) - 2
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<itemCount, id: \.self) { _ in
                Rectangle()
                    .fill(Color.gray.opacity(0.5)) 
                    .frame(width: width, height: 160)
                    .clipped()
            }
        }
    }
}

/*
#Preview {
    PostGridView()
}
*/

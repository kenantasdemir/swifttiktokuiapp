import SwiftUI

struct CommentCellView: View {
    
    @State private var didLongPressed: Bool = false
    
    var comment: Comment
    
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: comment.user.image)) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(comment.user.name)
                        .font(.headline)
                    Text(comment.content)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.red)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .contentShape(Rectangle()) // Etkileşim alanı tanımlanıyor
            .onLongPressGesture {
                didLongPressed = true
            }
            .confirmationDialog("Bir seçim yapın", isPresented: $didLongPressed, titleVisibility: .visible) {
                Button("Yorumu sil", role: .destructive) {}
                Button("Yorumu düzenle") {}
                Button("Yorumu bildir") {}
                Button("İptal", role: .cancel) {}
            }
        }
    }
}

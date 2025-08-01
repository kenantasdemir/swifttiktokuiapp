
import SwiftUI

struct UserCellView: View {
 

    var user:User
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                
                
                
                
                AsyncImage(url: URL(string: user.image)) { image in
                              image
                                  .resizable()
                                  .scaledToFill()
                          } placeholder: {
                              ProgressView()
                          }
                          .frame(width: 40, height: 40)
                          .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .frame(maxWidth: .infinity, alignment: .leading)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
     
        .background(Color.white)
    }
}

#Preview {
    UserCellView(user: users[0])
}

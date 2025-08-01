

import SwiftUI

struct ProfileHeaderView: View {

    fileprivate func extractedFunc() -> some View {
        return VStack{
            Text("5")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text("Following")
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .frame(width: 80,alignment:.center)
    }
    

    
    var body: some View {
        VStack(spacing:16){
            VStack(spacing:8){
                
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.blue)
                    .clipShape(Circle())
                
                Text("kenant103")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            HStack(spacing:16){
                UserStatView(value: 5, title: "Followings")
                UserStatView(value: 15, title: "Followers")
                UserStatView(value: 298, title: "Likes")
            }
            
            Button{
                
            }label: {
                Text("Edit profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360,height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            Divider()
            
            
            
        }
    }
}




import SwiftUI

struct ChatCellView: View {

    @State private var isActive:Bool = true
        
    var user:User
    var body: some View {
        VStack{
       
            NavigationLink(destination:ChatPageView(user: user)){
                HStack(spacing:12){
                    AsyncImage(url: URL(string: user.image)){ image in
                        image.resizable()
                            .scaledToFit()
                    }placeholder:{
                        ProgressView()
                    }.frame(width: 40,height: 40)
                        .clipShape(Circle())
                    
                    VStack(alignment:.leading){
                        Text(user.name)
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.red)  
                    
                    
                }
                .padding()
                .cornerRadius(12)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            
            .background(Color.white)
        }
    }
}

#Preview {
    ChatCellView(user: users[0])
}


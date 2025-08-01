
import SwiftUI
import Foundation

struct ChatPageView: View {
    var user: User
    
    @State private var messages: [Message] = [
        Message(text: "Merhaba!", isFromCurrentUser: false),
        Message(text: "Nasılsın?", isFromCurrentUser: false),
        Message(text: "İyiyim, sen?", isFromCurrentUser: true)
    ]
    @State private var newMessageText: String = ""
    @State private var shouldFocusTextField = false
    @State private var showProfile = false

    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 8) {
                    
                    VStack{
                        AsyncImage(url: URL(string: user.image)){ image in
                            image.resizable()
                            image.scaledToFill()
                        }placeholder:{
                            ProgressView()
                        }.frame(width:90,height: 90)
                            .clipShape(Circle())
                        
                        Text(user.name)
                    }
                    
                    
                    
                    ForEach(messages) { message in
                        MessageRow(message: message)
                    }
                }
                .padding()
            }
            
            HStack {
                TextField("Mesaj...",text: $newMessageText)
                    .frame(height: 40)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .rotationEffect(.degrees(45))
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color(UIColor.systemGray6))
        }
        .navigationTitle(user.name)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 8) {
                    AsyncImage(url: URL(string: user.image)) { image in
                        image.resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())

                    Text(user.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .onTapGesture {
                            showProfile = true
                        }
                        .navigationDestination(isPresented: $showProfile) {
                            PreviewProfileView(user: user)
                        }
                    

                    Spacer() 
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "flag")
                }
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }
            }
        }

        .onAppear {
            UITabBar.appearance().isHidden = true
        }
        .onAppear{
            UITabBar.appearance().isHidden = false
        }
    }
    
    private func sendMessage() {
        guard !newMessageText.isEmpty else { return }
        messages.append(Message(text: newMessageText, isFromCurrentUser: true))
        newMessageText = ""
    }
}

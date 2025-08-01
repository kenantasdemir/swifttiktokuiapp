

import SwiftUI
import AVKit


struct FeedCell: View {
    //View struct'ları içinde doğrudan var ile tanımlanmış değerleri değiştiremezsin. bu yüzden @State kullan.
    @State private var didVideoliked = false
    @State private var didVideoBookmarked = false
    @State private var navigate = false
    @State private var showActionSheet = false

    @State var isPlaying:Bool = true
    
    @State private var selectedTab:FeedTab = .forYou
    
    let post: Post
    var player: AVPlayer
    @Binding var isEmptyScreenEnabled: Bool // Dışarıdan gelen bağlama
    
    var body: some View {
        
            ZStack {
                CustomVideoPlayer(player: player)
                    .containerRelativeFrame([.horizontal, .vertical])
                    .onTapGesture {
                        isPlaying.toggle()
                        isPlaying ? player.play() : player.pause()
                    }
                
                if !isEmptyScreenEnabled {
                    VStack{
                        HStack{
                            VStack(spacing: 4) {
                                Image(systemName: "dot.radiowaves.left.and.right")
                                Text("LIVE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.red)
                            ForEach(FeedTab.allCases, id: \.self) { tab in
                                VStack(spacing: 4) {
                                    Text(tab.rawValue)
                                        .font(.title3)
                                        .fontWeight(selectedTab == tab ? .bold : .regular)
                                        .foregroundStyle(.white)
                                        .onTapGesture {
                                          
                                            selectedTab = tab
                                        
                                        }.font(.system(size: 1))
                                    
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(selectedTab == tab ? .white : .clear)
                                }
                            }
                        }
                        .padding(.top,70)
                        Spacer()
                        HStack(alignment:.bottom){
                            VStack(alignment:.leading){
                                Text("kenant42")
                                    .fontWeight(.semibold)
                                Text("Açıklama")
                            }
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .padding([.bottom],90)
                            
                            Spacer()
                            
                            VStack(spacing:28){
                                
                                ZStack(alignment:.bottom){
                                    Circle()
                                        .frame(width: 48,height: 48)
                                        .foregroundStyle(.gray)
                                    Button{
                                        
                                    }label: {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.white)
                                        
                                            .background(.red)
                                            .clipShape(Circle())
                                    }
                                    .padding(.bottom, -4)
                                    
                                }
                                
                                
                                Button{
                                    didVideoliked = !didVideoliked
                                }label:{
                                    VStack{
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .foregroundStyle(didVideoliked ? Color.red : Color.white)
                                        Text("28")
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                            .bold()
                                    }
                                }
                                
                                Button{
                                    navigate = true
                                }label:{
                                    VStack{
                                        Image(systemName: "ellipsis.bubble.fill")
                                            .resizable()
                                            .frame(width: 28, height: 28)
                                            .foregroundStyle(.white)
                                        Text("25").font(.caption)
                                            .foregroundStyle(.white)
                                            .bold()
                                    }
                                }
                                .sheet(isPresented: $navigate) {
                                    CommentsPageView()
                                }
                                
                                Button{
                                    didVideoBookmarked = !didVideoBookmarked
                                }label:{
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .frame(width: 22, height: 28)
                                        .foregroundStyle(didVideoBookmarked ? .yellow : .white)
                                }
                                
                                Button{
                                    
                                }label:{
                                    Image(systemName: "arrowshape.turn.up.right.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .foregroundStyle(.white)
                                }
                                
                                RotatingGradientCircleView()
                            }
                            .padding(.bottom,80)
                            
                        }
                        .padding()
                    }
                    
                    
                }
            }
            .onTapGesture(count: 2) { didVideoliked = true }
            .onLongPressGesture { showActionSheet = true }
            .confirmationDialog("İşlem Seç", isPresented: $showActionSheet) {
                Button(isEmptyScreenEnabled ? "Temiz ekrandan çık" : "Temiz ekran") {
                    isEmptyScreenEnabled.toggle()
                }
                Button("İptal", role: .cancel) { }
            }
            .onAppear {
                isPlaying = true
                player.play()
            }
            .onDisappear {
                player.pause()
            }
        
    }
}




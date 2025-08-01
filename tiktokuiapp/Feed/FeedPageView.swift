

import SwiftUI
import Foundation
import AVKit

struct FeedPageView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    @State private var isEmptyScreenEnabled: [String: Bool] = [:] // Post ID -> Bool
    
    @State private var isPlaying = true

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
               
                ForEach(viewModel.posts) { post in
                    FeedCell(
                       
                        post: post,
                        player: player,
                       
                        isEmptyScreenEnabled: Binding(
                            get: { isEmptyScreenEnabled[post.id, default: false] },
                            set: { isEmptyScreenEnabled[post.id] = $0 }
                        )
                    )
                    .onTapGesture {
                        isPlaying.toggle()
                        isPlaying ? player.play() : player.pause()
                    }
                    .id(post.id)
                }
            }
            .scrollTargetLayout()
        }
        .onAppear { player.play() }
        .onDisappear { player.pause() }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue)
            
       
            if let newValue = newValue {
                isEmptyScreenEnabled[newValue] = false
            }
        }
    }

    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

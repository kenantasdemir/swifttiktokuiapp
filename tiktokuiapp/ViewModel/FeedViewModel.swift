

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let videoUrls = [
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
        "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"
    ]
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        self.posts = [
            Post(id: UUID().uuidString, videoUrl: videoUrls[0], category: .forYou),
            Post(id: UUID().uuidString, videoUrl: videoUrls[1], category: .following),
            Post(id: UUID().uuidString, videoUrl: videoUrls[2], category: .discover),
            Post(id: UUID().uuidString, videoUrl: videoUrls[3], category: .forYou),
            Post(id: UUID().uuidString, videoUrl: videoUrls[4], category: .following),
        ]
    }
}

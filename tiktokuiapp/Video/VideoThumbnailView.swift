
import SwiftUI
import AVKit

struct VideoThumbnailView: View {
    let videoURL: URL
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoURL))
            .cornerRadius(8)
    }
}


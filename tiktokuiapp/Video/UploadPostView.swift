import SwiftUI
import PhotosUI
import AVKit

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var isPrivate: Bool = false
    @State private var selectedVideo: PhotosPickerItem?
    @State private var videoURL: URL?
    @State private var showCamera = false

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                
               
                ZStack {
                    if let videoURL = videoURL {
                        VideoPlayer(player: AVPlayer(url: videoURL))
                            .frame(height: 200)
                    } else {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 200)
                            .overlay(
                                Text("Video Seç veya Çek")
                                    .foregroundColor(.blue)
                            )
                    }
                }
                .cornerRadius(12)

          
                PhotosPicker(selection: $selectedVideo, matching: .videos) {
                    Text("Galeriden Video Seç")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .onChange(of: selectedVideo) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self),
                           let tempURL = FileManager.default.temporaryDirectory
                            .appendingPathComponent(UUID().uuidString + ".mp4") as URL? {
                            try? data.write(to: tempURL)
                            videoURL = tempURL
                        }
                    }
                }

     
                Button(action: {
                    showCamera = true
                }) {
                    Text("Kamerayla Video Çek")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                .sheet(isPresented: $showCamera) {
                    VideoPicker { url in
                        self.videoURL = url
                    }
                }

                TextField("Açıklama ekle...", text: $caption, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(3)

             
                Toggle("Gizli Gönderi", isOn: $isPrivate)

                Spacer()

                Button(action: uploadPost) {
                    Text("Yayınla")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .disabled(videoURL == nil || caption.isEmpty)
            }
            .padding()
            .navigationTitle("Yeni Gönderi")
        }
    }

    func uploadPost() {
        print("Video URL: \(videoURL?.absoluteString ?? "Yok")")
        print("Açıklama: \(caption)")
        print("Gizli mi?: \(isPrivate)")
    }
}

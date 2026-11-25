import SwiftUI
import AVKit

struct PlayerScreen: View {
    let drama: Drama
    let episode: Episode

    var body: some View {
        Group {
            if let url = episode.streamURL {
                VideoPlayer(player: AVPlayer(url: url))
                    .ignoresSafeArea()
            } else {
                VStack(spacing: 20) {
                    Image(systemName: "tv").font(.system(size: 72))
                    Text(drama.title).font(.largeTitle.bold())
                    Text(episode.title).font(.title2)
                    Text("播放器已就绪，但此集还没有合法授权的视频地址。")
                        .font(.headline).foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                    Text("接入红果或版权方正式提供的 API / SDK 和播放授权后，才能播放真实内容。")
                        .font(.body).foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .padding(60)
            }
        }
    }
}

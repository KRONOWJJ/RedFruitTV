import SwiftUI

struct DramaDetailView: View {
    let drama: Drama

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                Text(drama.title).font(.system(size: 48, weight: .bold))
                Text(drama.synopsis).font(.title2).foregroundStyle(.secondary)
                Label(drama.category, systemImage: "tag").font(.headline)
                Text("选择剧集").font(.largeTitle.bold())

                LazyVGrid(columns: [GridItem(.adaptive(minimum: 190), spacing: 18)], spacing: 18) {
                    ForEach(drama.episodes) { episode in
                        NavigationLink {
                            PlayerScreen(drama: drama, episode: episode)
                        } label: {
                            VStack(alignment: .leading, spacing: 10) {
                                Image(systemName: "play.rectangle.fill").font(.system(size: 34))
                                Text(episode.title).font(.headline)
                                Text(episode.streamURL == nil ? "尚未配置播放源" : "立即播放")
                                    .font(.caption).foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, minHeight: 112, alignment: .leading)
                            .padding(18)
                            .background(Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 16))
                        }
                        .buttonStyle(.card)
                    }
                }
            }
            .padding(58)
        }
    }
}

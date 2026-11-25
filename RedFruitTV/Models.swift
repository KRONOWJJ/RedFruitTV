import Foundation

struct Episode: Identifiable, Hashable {
    let id: Int
    let title: String
    /// Only set this to a URL supplied by a rights-holder or authorized provider.
    let streamURL: URL?
}

struct Drama: Identifiable, Hashable {
    let id: String
    let title: String
    let synopsis: String
    let category: String
    let symbol: String
    let episodes: [Episode]
}

enum DemoCatalog {
    static let dramas: [Drama] = [
        Drama(id: "demo-001", title: "星际旅人", synopsis: "一段关于未知世界的冒险（演示内容）", category: "奇幻", symbol: "sparkles",
              episodes: (1...8).map { Episode(id: $0, title: "第\($0)集", streamURL: nil) }),
        Drama(id: "demo-002", title: "山海奇谈", synopsis: "走进东方幻想故事（演示内容）", category: "国风", symbol: "mountain.2",
              episodes: (1...6).map { Episode(id: $0, title: "第\($0)集", streamURL: nil) }),
        Drama(id: "demo-003", title: "未来档案", synopsis: "来自未来的神秘来信（演示内容）", category: "科幻", symbol: "atom",
              episodes: (1...10).map { Episode(id: $0, title: "第\($0)集", streamURL: nil) })
    ]
}

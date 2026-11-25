import SwiftUI

struct HomeView: View {
    @State private var selectedCategory = "推荐"
    private let categories = ["推荐", "热门", "奇幻", "国风", "科幻", "悬疑"]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 34) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("红果漫剧 TV")
                            .font(.system(size: 50, weight: .bold))
                        Text("为大屏幕打造的漫剧体验")
                            .font(.title3)
                            .foregroundStyle(.secondary)
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(categories, id: \.self) { category in
                                Button {
                                    selectedCategory = category
                                } label: {
                                    Text(category)
                                        .font(.headline)
                                        .padding(.horizontal, 24)
                                        .padding(.vertical, 13)
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(selectedCategory == category ? .red : .gray.opacity(0.35))
                            }
                        }
                    }

                    Text("为你推荐").font(.largeTitle.bold())
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 270), spacing: 26)], spacing: 28) {
                        ForEach(DemoCatalog.dramas) { drama in
                            NavigationLink(value: drama) {
                                DramaCard(drama: drama)
                            }
                            .buttonStyle(.card)
                        }
                    }
                }
                .padding(.horizontal, 64)
                .padding(.vertical, 44)
            }
            .background(Color.black)
            .navigationDestination(for: Drama.self) { drama in
                DramaDetailView(drama: drama)
            }
        }
    }
}

private struct DramaCard: View {
    let drama: Drama
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(LinearGradient(colors: [.red.opacity(0.65), .purple.opacity(0.55), .blue.opacity(0.45)],
                                         startPoint: .topLeading, endPoint: .bottomTrailing))
                Image(systemName: drama.symbol)
                    .font(.system(size: 64, weight: .light))
                    .foregroundStyle(.white)
            }
            .frame(height: 170)
            Text(drama.title).font(.title3.bold())
            Text(drama.synopsis).font(.subheadline).foregroundStyle(.secondary).lineLimit(2)
            Text(drama.category.uppercased()).font(.caption.bold()).foregroundStyle(.red)
        }
        .padding(14)
        .background(Color.white.opacity(0.07), in: RoundedRectangle(cornerRadius: 22))
    }
}

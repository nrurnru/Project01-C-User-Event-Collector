//
//  SearchSongTop100SectionView.swift
//  MiniVIBE
//
//  Created by 최동규 on 2020/12/03.
//

import SwiftUI

struct SearchSongTop100SectionView: View {
    private enum Constant {
        static let title: String = "음악검색 Top 100"
    }
    
    @State private var items: [Song] = []
    private var mockItems: [Song]
        = (0...30).map { idx -> Song in
            Song(imageURLString: "HomeDJStationSection1", title: "Test Music\(idx)", artist: "dochoi")
        }
    var body: some View {
        VStack {
            // FIXME: 네비게이션 링크
            // NavigationLink(destination: _) {
            MoreHeaderView(title: Constant.title)
            //   }
            SectionScrollView {
                FiveRowSongGirdView(songs: mockItems, showsranking: true)
            }
        }
    }
}
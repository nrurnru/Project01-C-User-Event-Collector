//
//  TodayView.swift
//  MiniVIBE
//
//  Created by 최광현 on 2020/11/17.
//

import SwiftUI
import Combine
import AuthenticationServices
import BCEventEmitter

struct TodayView: View {
    let viewModel: ViewModel
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Color.vibeBackground.ignoresSafeArea(edges: .top)
                    ScrollView(.vertical, showsIndicators: false) {
                        TodayHeaderView()
                        LazyVStack(spacing: 40) {
                            SummarySectionView()
                            ArtistSection()
                            PlaylistSectionView(viewModel: PlaylistSectionView.ViewModel(
                                                    container: viewModel.container, id: 0, title: "내 취향 플레이리스트", type: .normal))
                            DJStationSectionView()
                            FiveRowSongGridView(
                                viewModel: FiveRowSongGridView.ViewModel(container: viewModel.container, id: 0, title: "최근 들은 노래", showsRanking: false))
                            PlaylistSectionView(viewModel: PlaylistSectionView.ViewModel(
                                                    container: viewModel.container,                id: 1, title: "VIBE 추천 플레이리스트", type: .large))
                            AlbumSectionView(viewModel: AlbumSectionView.ViewModel(
                                                id: 1, title: "좋아할 최신앨범", showsRanking: false))
                            MagazineSectionView(viewModel: MagazineSectionView.ViewModel(container: viewModel.container))
                            NowSectionView()
                            TodayFooterView()
                        }
                        .padding(.bottom, NowPlayingBarView.height)
                    }
                    .padding(.top)
                    .navigationBarHidden(true)
                }
            }
            NowPlayingBarView()
        }
        .onAppear {
            emitEvent(event: MoveEvent(next: ContentView.TabType.today.description))
        }
    }
}

extension TodayView {
    final class ViewModel {
        let container: DIContainer
        
        init(container: DIContainer) {
            self.container = container
        }
    }
}

//
//  MiniVIBEApp.swift
//  MiniVIBE
//
//  Created by 최동규 on 2020/11/16.
//

import SwiftUI

@main
struct MiniVIBEApp: App {
    let container: DIContainer
    
    init() {
        UITabBar.appearance().barTintColor = .black
        // FIXME: 서버 완성되면 수정
        let fakeServerRepository = FakeServerRepository(network: Network())
        let localRepository = RealLocalRepository()
        let serverRepository = RealServerRepository(network: Network())
        let eventService = RealEventService(serverRepository: fakeServerRepository, localRepository: localRepository)
        let musicPlayer = MusicPlayer()
        container = DIContainer(serverRepository: fakeServerRepository,
                                localRepository: localRepository,
                                eventService: eventService,
                                musicPlayer: musicPlayer)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentView.ViewModel(container: container)).environmentObject(container.musicPlayer)
        }
    }
    
}

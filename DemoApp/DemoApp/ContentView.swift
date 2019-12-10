//
//  ContentView.swift
//  DemoApp
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI
import PostsUI
import NetworkServiceA
import NetworkServiceB


/// Adapter for the network service using framework A (URLSession)
struct PostsNetworkServiceA: PostsNetworkServiceInterface {

    private let networkService = NetworkServiceA.NetworkService()

    func loadPosts(withURL url: URL, completion: @escaping (Result<[Post], Error>) -> Void) {
        networkService.loadJSON(withURL: url, type: [Post].self, completion: completion)
    }
}


/// Adapter for the network service using framework B (Alamofire)
struct PostsNetworkServiceB: PostsNetworkServiceInterface {

    private let networkService = NetworkServiceB.NetworkService()

    func loadPosts(withURL url: URL, completion: @escaping (Result<[Post], Error>) -> Void) {
        networkService.load(url, type: [Post].self, completion: completion)
    }
}


struct ContentView: View {

    private let networkServiceA = PostsNetworkServiceA()
    private let networkServiceB = PostsNetworkServiceB()

    var body: some View {
        TabView {
            NavigationView {
                PostView(networkService: networkServiceA)
                    .navigationBarTitle("Posts", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "safari")
                Text("URLSession")
            }

            NavigationView {
                PostView(networkService: networkServiceB)
                    .navigationBarTitle("Posts", displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "flame")
                Text("Alamofire")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

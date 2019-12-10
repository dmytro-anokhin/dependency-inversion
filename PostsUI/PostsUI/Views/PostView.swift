//
//  PostView.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI

public struct PostView: View {

    private let networkService: PostsNetworkServiceInterface

    public init(networkService: PostsNetworkServiceInterface) {
        self.networkService = networkService
    }

    @State var posts: [Post] = []

    @State var loaded = false

    public var body: some View {
        if !loaded {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

            networkService.loadPosts(withURL: url) { result in
                self.loaded = true

                switch result {
                    case .success(let posts):
                        self.posts = posts

                    case .failure(let error):
                        print("Failed to load posts with error: \(error)")
                }
            }
        }

        return PostsListView(posts: posts)
    }
}

struct PostView_Previews: PreviewProvider {

    static var previews: some View {
        PostView(networkService: PostsNetworkServiceMock())
    }
}

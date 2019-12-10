//
//  PostView.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI
import DataModels


public struct PostView: View {

    let dataProvider: DataProvider

    public init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }

    @State var posts: [Post]?

    public var body: some View {
        if posts == nil {
            let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!

            dataProvider.fetchPosts(withURL: url) { result in
                switch result {
                    case .success(let posts):
                        self.posts = posts

                    case .failure(let error):
                        print("Failed to load posts with error: \(error)")
                        self.posts = []
                }
            }
        }

        return PostsListView(dataProvider: dataProvider, posts: posts ?? [])
    }
}

struct PostView_Previews: PreviewProvider {

    static var previews: some View {
        PostView(dataProvider: DataProviderMock())
    }
}

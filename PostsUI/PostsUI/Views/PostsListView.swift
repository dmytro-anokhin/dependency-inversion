//
//  PostsListView.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI
import DataModels


struct PostsListView: View {

    let dataProvider: DataProvider

    let posts: [Post]

    init(dataProvider: DataProvider, posts: [Post]) {
        self.dataProvider = dataProvider
        self.posts = posts
    }

    var body: some View {
        List(posts, id: \.self) {
            PostsListRowView(dataProvider: self.dataProvider, post: $0)
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView(dataProvider: DataProviderMock(), posts: [
            .testPost
        ])
    }
}

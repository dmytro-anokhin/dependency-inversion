//
//  PostsListView.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI

struct PostsListView: View {

    let posts: [Post]

    init(posts: [Post]) {
        self.posts = posts
    }

    var body: some View {
        List(posts, id: \.self) {
            PostsListRowView(post: $0)
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView(posts: [
            .testPost
        ])
    }
}

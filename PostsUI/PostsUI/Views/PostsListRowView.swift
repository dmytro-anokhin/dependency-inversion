//
//  PostsListRowView.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI

struct PostsListRowView: View {

    let post: Post

    init(post: Post) {
        self.post = post
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.title)
                .lineLimit(2)
            Spacer()
            Text(post.body).font(.body)
            Spacer()
            HStack {
                Text(String(post.userId))
                Spacer()
                Text(String(post.id))
            }
        }
    }
}

struct PostsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListRowView(post: .testPost)
    }
}

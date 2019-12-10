//
//  PostsListRowView.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import SwiftUI
import DataModels


struct PostsListRowView: View {

    let dataProvider: DataProvider

    let post: Post
    
    @State var userName: String?

    init(dataProvider: DataProvider, post: Post) {
        self.dataProvider = dataProvider
        self.post = post
    }

    var body: some View {
        if userName == nil {
            dataProvider.fetchUser(withId: post.userId) { user in
                self.userName = user?.username ?? "Unknown"
            }
        }
        
        return VStack(alignment: .leading, spacing: 10.0) {
            Spacer()
            Text(String(userName ?? "Unknown"))
                .font(.subheadline)
                .lineLimit(1)
            Text(post.title)
                .font(.headline)
                .lineLimit(2)
            Text(post.body)
                .font(.body)
                .lineLimit(4)
            Spacer()
        }
    }
}

struct PostsListRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListRowView(dataProvider: DataProviderMock(), post: .testPost)
    }
}

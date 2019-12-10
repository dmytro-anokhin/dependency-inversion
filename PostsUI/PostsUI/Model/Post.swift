//
//  Post.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

public struct Post: Codable, Hashable {

    public var userId: Int

    public var id: Int

    public var title: String

    public var body: String
}


extension Post {

    static let testPost = Post(userId: 0, id: 0, title: "Test", body: "Hello, world!")
}

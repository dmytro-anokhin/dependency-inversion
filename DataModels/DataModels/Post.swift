//
//  Post.swift
//  DataModels
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

public struct Post: Codable, Hashable {

    public var userId: Int

    public var id: Int

    public var title: String

    public var body: String
 
    public init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}

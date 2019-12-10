//
//  PostsNetworkService.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import Foundation


public protocol PostsNetworkServiceInterface {

    func loadPosts(withURL url: URL, completion: @escaping (Result<[Post], Error>) -> Void)
}


struct PostsNetworkServiceMock: PostsNetworkServiceInterface {

    func loadPosts(withURL url: URL, completion: @escaping (Result<[Post], Error>) -> Void) {
        completion(.success([
            .testPost
        ]))
    }
}

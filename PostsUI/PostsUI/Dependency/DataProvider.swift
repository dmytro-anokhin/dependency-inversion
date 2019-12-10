//
//  DataProvider.swift
//  PostsUI
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import Foundation
import DataModels


public protocol DataProvider {

    func fetchPosts(withURL url: URL, completion: @escaping (Result<[Post], Error>) -> Void)
    
    func fetchUser(withId id: Int, completion: @escaping (User?) -> Void)
}


struct DataProviderMock: DataProvider {

    func fetchPosts(withURL url: URL, completion: @escaping (Result<[Post], Error>) -> Void) {
        completion(.success([]))
    }
    
    func fetchUser(withId id: Int, completion: @escaping (User?) -> Void) {
        completion(nil)
    }
}

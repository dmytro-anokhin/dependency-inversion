//
//  NetworkingB+PostsUI.swift
//  DemoApp
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import PostsUI
import DataModels
import Services
import NetworkingB


/// Adapter for the data provider using framework B (Alamofire)
struct PostsDataProviderB: DataProvider {

    private let networkService: NetworkingB.NetworkService
    
    private let userService: UserService

    init() {
        let networkService = NetworkingB.NetworkService()
        
        self.networkService = networkService
        self.userService = UserService(networkService: networkService)
    }

    func fetchPosts(withURL url: URL, completion: @escaping (Result<[Post], Error>) -> Void) {
        networkService.load(url, type: [Post].self, completion: completion)
    }
    
    func fetchUser(withId id: Int, completion: @escaping (User?) -> Void) {
        userService.getUser(withId: id, completion: completion)
    }
}

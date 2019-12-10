//
//  NetworkingB+UserNetworkService.swift
//  Services
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import NetworkingB
import DataModels


extension NetworkingB: UserNetworkService {
    
    public func loadUsers(withURL url: URL, completion: @escaping (Result<[User], Error>) -> Void) {
        load(url, type: [User].self, completion: completion)
    }
}

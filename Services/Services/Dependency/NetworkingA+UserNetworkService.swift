//
//  NetworkingA+UserNetworkService.swift
//  Services
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import NetworkingA
import DataModels


extension NetworkingA: UserNetworkService {
    
    public func loadUsers(withURL url: URL, completion: @escaping (Result<[User], Error>) -> Void) {
        loadJSON(withURL: url, type: [User].self, completion: completion)
    }
}

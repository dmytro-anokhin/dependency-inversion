//
//  UserNetworkService.swift
//  Services
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import Foundation
import DataModels


public protocol UserNetworkService {

    func loadUsers(withURL url: URL, completion: @escaping (Result<[User], Error>) -> Void)
}

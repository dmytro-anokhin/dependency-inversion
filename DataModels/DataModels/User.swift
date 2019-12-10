//
//  User.swift
//  DataModels
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

public struct User: Codable, Hashable {
    
    public var id: Int
    
    public var username: String
    
    public init(id: Int, username: String) {
        self.id = id
        self.username = username
    }
}

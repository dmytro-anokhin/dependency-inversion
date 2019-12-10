//
//  UserService.swift
//  Services
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import DataModels


public final class UserService {
    
    public let networkService: UserNetworkService

    public init(networkService: UserNetworkService) {
        self.networkService = networkService
    }

    public func getUser(withId userId: Int, completion: @escaping (User?) -> Void) {
        queue.async {
            if self.state == .loaded {
                completion(self.store[userId])
                return
            }
            
            if let pendingGetUser = self.pendingGetUser {
                self.pendingGetUser = {
                    pendingGetUser()
                    self.getUser(withId: userId, completion: completion)
                }
            }
            else {
                self.pendingGetUser = {
                    self.getUser(withId: userId, completion: completion)
                }
            }
            
            self.loadStoreIfNeeded()
        }
    }
    
    private enum State {
    
        case initial
        
        case loading
        
        case loaded
        
        case failed
    }
    
    private let queue = DispatchQueue.init(label: "Services.UserService.queue")
    
    private var store: [Int: User] = [:]
    
    private var state: State = .initial
    
    private var pendingGetUser: (() -> Void)?
    
    private func loadStoreIfNeeded() {
        guard state == .initial else {
            return
        }
        
        state = .loading
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        networkService.loadUsers(withURL: url) { result in
            self.queue.async {
                switch result {
                    case .success(let users):
                        self.store = users.reduce(into: [:]) { $0[$1.id] = $1 }
                        self.state = .loaded
                        
                    case .failure(let error):
                        print("Failed to load users with error: \(error)")
                        self.state = .failed
                }
                
                self.pendingGetUser?()
                self.pendingGetUser = nil
            }
        }
    }
}

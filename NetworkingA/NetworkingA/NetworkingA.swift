//
//  NetworkingA.swift
//  NetworkingA
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import Foundation


public final class NetworkingA {

    public init() {
    }

    public func loadJSON<T: Decodable>(withURL url: URL, type: T.Type = T.self, completion: @escaping (Result<T, Error>) -> Void) {
        urlSession.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
            else {
                completion(.failure(error ?? NSError(domain: "NetworkingA", code: 0, userInfo: nil)))
            }
        }
        .resume()
    }

    private let urlSession = URLSession(configuration: .default)
}

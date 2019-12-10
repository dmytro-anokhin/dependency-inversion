//
//  NetworkService.swift
//  NetworkingB
//
//  Created by Dmytro Anokhin on 10/12/2019.
//  Copyright © 2019 Dmytro Anokhin. All rights reserved.
//

import Foundation
import Alamofire


public final class NetworkService {

    public init() {
    }

    public func load<T: Decodable>(_ url: URL, type: T.Type = T.self, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url).responseDecodable(of: type, queue: .main, decoder: JSONDecoder()) { response in
            switch response.result {
                case .success(let result):
                    completion(.success(result))

                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}

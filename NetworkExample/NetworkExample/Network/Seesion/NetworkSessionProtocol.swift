//
//  NetworkSessionProtocol.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

protocol NetworkSessionProtocol {
    func dataTask(
        with request: URLRequest,
        completion: @escaping(Result<NetworkResponse, Error>) -> Void
    )
}

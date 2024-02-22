//
//  NetworkDeserializerable.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

protocol NetworkDeserializerable {
    func deserialize<T: Decodable>(_ data: Data) throws -> T
}

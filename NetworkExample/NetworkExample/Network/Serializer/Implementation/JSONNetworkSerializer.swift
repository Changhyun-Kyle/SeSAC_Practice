//
//  JSONNetworkSerializer.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

struct JSONNetworkSerializer: NetworkSerializerable {
    func serialize<T>(_ parameters: Data) throws -> T where T : Decodable {
        try JSONSerialization.data(withJSONObject: parameters)
    }
}

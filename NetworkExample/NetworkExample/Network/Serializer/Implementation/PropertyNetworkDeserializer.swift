//
//  PropertyNetworkDeserializer.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

struct PropertyNetworkDeserializer: NetworkDeserializerable {
    func deserialize<T>(_ data: Data) throws -> T where T : Decodable {
        <#code#>
    }
}

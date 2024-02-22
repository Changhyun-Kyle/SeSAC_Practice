//
//  JSONNetworkDeserializer.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

struct JSONNetworkDeserializer: NetworkDeserializerable {
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func deserialize<T>(_ data: Data) throws -> T where T : Decodable {
        try decoder.decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: data)
    }
    
    
}

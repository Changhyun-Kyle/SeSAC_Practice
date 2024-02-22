//
//  NetworkBuilderProtocol.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

protocol NetworkBuilderProtocol {
    associatedtype Response: Decodable
    
    var path: String { get }
    var headers: [String: String] { get }
    var parmeters: [String: Any] { get }
    var serializer: NetworkSerializerable { get }
    var deserializer: NetworkDeserializerable { get }
        
    var useAuthorization: Bool { get }
}

extension NetworkBuilderProtocol {
    var headers: [String: String] { [:] }
    var serializer: NetworkSerializerable {
        JSONNetworkSerializer()
    }
}

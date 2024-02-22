//
//  NetworkSerializerable.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

protocol NetworkSerializerable {
    func serialize<T: Decodable>(_ data: Data) throws -> T
}


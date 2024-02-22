//
//  CacheStorageProtocol.swift
//  CacheExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

protocol CacheStorageProtocol {
    func load(for key: String) -> Data?
    func save(_ data: Data, for key: String)
}

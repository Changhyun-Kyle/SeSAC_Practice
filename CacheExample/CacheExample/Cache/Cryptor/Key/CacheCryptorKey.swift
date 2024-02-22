//
//  CacheCryptorKey.swift
//  CacheExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

struct CacheCryptorKey {
    let key: Data
    let nonce: Data
}

extension CacheCryptorKey {
    static var defaultKety: Data {
        return
    }
}

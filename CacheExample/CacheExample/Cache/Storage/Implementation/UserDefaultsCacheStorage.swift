//
//  UserDefaultsCacheStorage.swift
//  CacheExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

final class UserDefaultsCacheStorage: CacheStorageProtocol {
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    func load(for key: String) -> Data? {
        
    }
    
    func save(_ data: Data, for key: String) {
        
    }
}

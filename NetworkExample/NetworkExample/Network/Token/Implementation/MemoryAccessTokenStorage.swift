//
//  MemoryAccessTokenStorage.swift
//  NetworkExample
//
//  Created by 강창현 on 2/20/24.
//

import Foundation

final class MemoryAccessTokenStorage: AccessTokenProvidable, AccessTokenStorable {
    var accessToken: String?
    
    func store(_ accessToken: String?) {
        
    }
}

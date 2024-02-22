//
//  CacheManager.swift
//  CacheExample
//
//  Created by kawoou on 2023/02/10.
//

import Foundation
import CryptoKit

final class CacheManager {

    // MARK: - Constants

    private struct Constants {
        static let key = "164e0d602db8cae3d0b886cc7a60e415".data(using: .utf8)!
        static let nonce = "3kdmfjkekaskjahe132kluh".data(using: .utf8)!
    }
    
    private let userDefaults: UserDefaultsProtocol
    
    // MARK: - Static

    static let shared = CacheManager(userDefaults: UserDefaults.standard)

    // MARK: - Lifecycle

    private init(userDefaults: UserDefaultsProtocol) {
        self.userDefaults = userDefaults
    }

    // MARK: - Public

    func get(
        for key: String,
        storage: CacheStorageProtocol
    ) -> Data? {
        userDefaults.data(forKey: "cache_\(key)")
    }

    func store(
        _ value: Data,
        for key: String,
        storage: CacheStorageProtocol
    ) throws {
        userDefaults.set(value, forKey: "cache_\(key)")
    }

    func getForAES(for key: String) -> Data? {
        guard let data = userDefaults.data(forKey: "cache_\(key)") else { return nil }

        guard let sealedBox = try? AES.GCM.SealedBox(nonce: .init(data: Constants.nonce), ciphertext: data.dropLast(16), tag: data.suffix(16)) else { return nil }
        return try? AES.GCM.open(sealedBox, using: .init(data: Constants.key))
    }

    func storeForAES(_ value: Data, for key: String) throws {
        let sealedBox = try AES.GCM.seal(value, using: .init(data: Constants.key), nonce: .init(data: Constants.nonce))

        let data = sealedBox.ciphertext + sealedBox.tag
        userDefaults.set(data, forKey: "cache_\(key)")
    }
}

protocol UserDefaultsProtocol {
    func data(forKey defaultName: String) -> Data?
    func set(
        _ value: Any?,
        forKey defaultName: String
    )
}

extension UserDefaults: UserDefaultsProtocol {}

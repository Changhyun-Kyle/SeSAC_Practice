//
//  Leakable.swift
//  LeakMemory
//
//  Created by Do Yi Lee on 1/29/24.
//

import Foundation

protocol Leakable: AnyObject {
    func createLeaks()
}

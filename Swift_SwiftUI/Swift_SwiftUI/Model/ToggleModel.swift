//
//  ToggleModel.swift
//  Swift_SwiftUI
//
//  Created by 강창현 on 3/20/24.
//

import Foundation

//final class ToggleModel: ObservableObject {
//    @Published var isEnvOn: Bool = false
//    @Published var nickName: String = "배가 고픈 하마"
//}

// MARK: - Macro

@Observable
final class ToggleModel {
    var isEnvOn: Bool = false
    var nickName: String = "배가 고픈 하마"
}

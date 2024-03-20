//
//  Swift_SwiftUIApp.swift
//  Swift_SwiftUI
//
//  Created by 강창현 on 3/20/24.
//

import SwiftUI

@main
struct Swift_SwiftUIApp: App {
    private let toggleModel = ToggleModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(toggleModel)
        }
    }
}

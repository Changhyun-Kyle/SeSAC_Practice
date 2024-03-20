//
//  SwiftUIView.swift
//  Swift_SwiftUI
//
//  Created by 강창현 on 3/20/24.
//

import SwiftUI

final class ToggleModel: ObservableObject {
    @Published var isEnvOn: Bool = false
    @Published var nickName: String = "배가 고픈 하마"
}

struct ContentView: View {
    @EnvironmentObject private var toggleModel: ToggleModel
    var body: some View {
        NavigationStack {
            TabView {
                HStack {
                    ToggleView()
                    ToggleView()
                }
                .padding()
                .tabItem { Text("toogle") }

                NavigationLink {
                    NicknameView()
                } label: {
                    Text("닉네임 진짜 바꾸기")
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(.buttonBorder)
                }
                .tabItem { Text("User") }
            }.navigationTitle("@Property Wrapper")
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ToggleModel())
}

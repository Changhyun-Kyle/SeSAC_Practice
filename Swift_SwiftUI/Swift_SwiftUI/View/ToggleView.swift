//
//  ContentView.swift
//  Swift_SwiftUI
//
//  Created by 강창현 on 3/20/24.
//

import SwiftUI

struct ToggleView: View {
    @State private var isStateOn: Bool = false
    @Environment(ToggleModel.self) private var toggleModel
    
    var body: some View {
        @Bindable var toggleModel = toggleModel
        VStack {
            Text(toggleModel.nickName.isEmpty ? "닉네임을 설정해주세요" : toggleModel.nickName)
                .bold()
                .foregroundStyle(.blue)
            Text(isStateOn ? "State On" : "State Off")
            Text(toggleModel.isEnvOn ? "Env On" : "Env Off")
            VStack {
                Toggle(isOn: $isStateOn) {
                    Text("State")
                }
                Toggle(isOn: $toggleModel.isEnvOn) {
                    Text("Env")
                }
            }
        }
        .padding()
        .border(.blue, width: 5)
    }
}

#Preview {
    ToggleView()
        .environment(ToggleModel())
}

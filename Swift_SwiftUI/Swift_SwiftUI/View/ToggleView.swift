//
//  ContentView.swift
//  Swift_SwiftUI
//
//  Created by 강창현 on 3/20/24.
//

import SwiftUI

struct ToggleView: View {
    @State private var isStateOn: Bool = false
    @EnvironmentObject private var toggleModel: ToggleModel
    
    var body: some View {
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
        .environmentObject(ToggleModel())
}

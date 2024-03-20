//
//  NicknameView.swift
//  Swift_SwiftUI
//
//  Created by 강창현 on 3/20/24.
//

import SwiftUI

struct NicknameView: View {
    @EnvironmentObject private var toggleModel: ToggleModel
    var body: some View {
        VStack {
            TextField("진짜 닉네임을 써라", text: $toggleModel.nickName)
                .padding()
                .border(Color.blue, width: 5)
        }
        .padding()
    }
}

#Preview {
    NicknameView()
        .environmentObject(ToggleModel())
}

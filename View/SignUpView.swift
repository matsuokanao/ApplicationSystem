
//
//  SignUpView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/25.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
@State private var pushSignUp = false
    
    var body: some View {
        // HomeViewへ遷移する
        VStack(spacing: 80) {
            Button(action: {
        // ログイン時の処理を書く
        // ユーザーデフォルトにtokenを保持するとか
        UserDefaults.standard.set("token", forKey: "apiToken")
            self.pushSignUp = true
            }) {
            Text("新規登録する")
            }
        NavigationLink(destination: ContentView(),
            isActive: self.$pushSignUp) {
            EmptyView()
            }.hidden()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

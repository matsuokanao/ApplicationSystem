//
//  LoginView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/25.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct LoginView: View {
@State var inputEmail: String = ""
@State var inputPassword: String = ""


var body: some View {
    NavigationView {
    VStack(alignment: .center) {
        Text("ログイン")
            .font(.system(size: 30,
                      weight: .heavy))
        
    VStack(spacing: 30) {
        TextField("メールアドレスを入力して下さい", text: $inputEmail)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(maxWidth: 280)
        SecureField("パスワードを入力して下さい", text: $inputPassword)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(maxWidth: 280)
                }.frame(height: 200)
        VStack(spacing: 24) {
        Button(action: {print("Login処理")
                    },label: {
            Text("Login")
                .fontWeight(.medium)
                .frame(minWidth: 160)
                .foregroundColor(.white)
                .padding(12)
                .background(Color.accentColor)
                .cornerRadius(8)
                    })
            
            Text("ーーアカウントをお持ちでないですか？ーー")
                .font(.footnote)
                .fontWeight(.thin)
                Button(action: {print("Signup処理")
                },label: {
        Text("アカウント作成")
            .fontWeight(.medium)
            .frame(minWidth: 160)
            .foregroundColor(.white)
            .padding(12)
            .background(Color.accentColor)
            .cornerRadius(8)
                })
            Spacer()
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


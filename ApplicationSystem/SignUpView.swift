//
//  SignUpView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    @State private var pushSignUp = false
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func  singUp(){
        session.singUp(email: email,password: password){ (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
        }
    }
}
        var body: some View{
            VStack{
                Text("アカウント作成")
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(Color("PinkRed"))
                
                Text("項目を入力してください")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color.gray)
                
                VStack(spacing: 18){
                    TextField("メールアドレス設定", text: $email)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("PinkRed"),
                            lineWidth: 1))
                    
                    SecureField("パスワード設定", text: $password)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("PinkRed"),
                        lineWidth: 1))
                    }.padding(.vertical, 64)
                
                Button(action: singUp){
                    Text("アカウントを作る")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color("PinkRed"),Color("PinkRed")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(5)
                }
                if (error != ""){
                    Text("エラーが発生しました")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.red)
                    .padding()
            }
                Spacer()
        }.padding(.horizontal,32)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


    
        

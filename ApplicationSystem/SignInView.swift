//
//  SignInView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    @State private var isActive = false
    
    func singIn(){
        session.signIn(email: email, password: password){ (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
        }
    }
}
    
    var body: some View{
        NavigationView{
            VStack{
                Text("おかえりなさい")
                    .font(.system(size: 32, weight: .heavy))
                    .foregroundColor(Color("PinkRed"))
                
                Text("ログインする")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(Color("PinkRed"))
                
                VStack(spacing: 18){
                    TextField("メールアドレス", text: $email)
                        .font(.system(size: 14))
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("PinkRed"),
                                    lineWidth: 1))
                    
                    SecureField("パスワード", text: $password)
                    .font(.system(size: 14))
                    .padding(12)
                        .background(RoundedRectangle(cornerRadius: 5).strokeBorder(Color("PinkRed"),
                                lineWidth: 1))
                }
                .padding(.vertical, 64)
                
                Button(action: singIn){
                    Text("ログイン")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color("PinkRed"),
                                                                               Color("PinkRed")]),
                                                   startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(5)
                }
                if (error != ""){
                    Text("項目を全て入力してください。")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.red)
                        .padding()
                }
                Spacer()
                
                HStack{
                    Text("アカウントを持っていませんか？")
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.primary)
        
            NavigationLink(destination: SignUpView()){
                    Text("アカウントを作る")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Color("PinkRed"))
                }
            }
        }.padding(.horizontal, 32)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
        }
    }
}

//
//  ContentView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/25.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase


struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home : View{
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View{
        
        NavigationView{
            
            VStack{
        //ログインしていたらHOMESCREENへ移動
                if self.status{
            TabView{
                Homescreen()
                    .tabItem{ Text("HOME")}
                ApplicationView()
                    .tabItem{Text("試合に申し込む")}
        //TODO 管理者のみボタンが見えるようにする
                RegisterView()
                    .tabItem{Text("試合を登録する")}
                InformationView()
                    .tabItem{Text("エントリー")}
                }
            } else {
                ZStack{
                    NavigationLink(destination: SingUp(show: self.$show), isActive: self.$show){
                        Text("")
                        }
                    .hidden()
                        Login(show: self.$show)
                    }
                }
            }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear{
            
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main)   { (_) in
                    
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}


//ログイン実装
struct Login : View {
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View{
        
    ZStack{
        ZStack(alignment: .topTrailing) {
            GeometryReader{_ in
        
        VStack{
            Image("loginview")
                .resizable()
                .frame(width: 300.0 , height: 180.0)
            Text("おかえりなさい")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.color)
            Text("--ログインしてください--")
                .foregroundColor(self.color)
                .padding(.top, 10)
            
            TextField("メールアドレス", text: self.$email)
                //自動大文字入力制御
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                .padding(.top, 25)
            
            HStack(spacing: 15){
                
                VStack{
                    
                if self.visible{
                    TextField("パスワード", text:  self.$pass)
                    .autocapitalization(.none)

                }else{
                    SecureField("パスワード", text: self.$pass)
                    .autocapitalization(.none)

                    }
                }
                Button(action: {
                    //クリックによってパスワードを表示
                    self.visible.toggle()
                    }) {
                        Image(systemName: self.visible ? "eye.slash.fill": "eye.fill")
                            .foregroundColor(self.color)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            .padding(.top, 25)
            
            //パスワード再設定処理
            HStack{
                Spacer()
                Button(action: {
                    self.reset()
                    })  {
                    Text("パスワードを忘れました")
                        .fontWeight(.bold)
                        .foregroundColor(Color("PinkRed"))
                }
            }
            .padding(.top,20)
            
            Button(action: {
                self.verify()
            }){
                Text("ログイン")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 25)
            }
            .padding(.horizontal, 25)
            }
            
            Button(action: {
                self.show.toggle()
            })  {
                Text("アカウントを作成する")
                        .fontWeight(.bold)
                        .foregroundColor(Color("PinkRed"))
            }
        .padding()
        }
        
        if self.alert{
            ErrorView(alert: self.$alert, error: $error)
            }
        }
    }
    //エラー分岐
    func verify(){
        if self.email != "" && self.pass != "" {
            //メールアドレスとパスワードを送る
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res,err) in
                if err != nil {
                    self.error = ""
                    self.alert.toggle()
                    return
                }
                print("成功！！")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"),object: nil)
            }
            
        }else{
            self.error = "すべての項目を埋めてください"
            self.alert.toggle()
        }
    }
    
    //パスワード再設定
    func reset(){
        if self.email != "" {
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "REST"
                self.alert.toggle()
            }
        }
        else{
            self.error = "正しいメールアドレスを入力してください"
            self.alert.toggle()
        }
    }
}

//アカウント登録
struct SingUp : View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""


    
    var body: some View{
        
        ZStack{
            
            ZStack(alignment: .topLeading) {
                GeometryReader{_ in
            
            VStack{
                Image("loginview")
                    .resizable()
                    .frame(width: 300.0 , height: 180.0)
                Text("アカウント登録")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(self.color)
                            
                TextField("メールアドレス", text: self.$email)
                    //自動大文字入力制御
                    .autocapitalization(.none)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    .padding(.top, 25)
                
                HStack(spacing: 15){
                    VStack{
                    if self.visible{
                        TextField("パスワード", text:  self.$pass)
                        .autocapitalization(.none)

                    }else{
                        SecureField("パスワード", text: self.$pass)
                        .autocapitalization(.none)

                        }
                    }
                    Button(action: {
                        //クリックによってパスワードを表示
                        self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye.slash.fill": "eye.fill")
                                .foregroundColor(self.color)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                .padding(.top, 25)
                
             HStack(spacing: 15){
                 VStack{
                 if self.revisible{
                     TextField("再入力", text:  self.$repass)
                    .autocapitalization(.none)

                 }else{
                     SecureField("再入力", text: self.$repass)
                    .autocapitalization(.none)

                     }
                 }
                 Button(action: {
                     //クリックによってパスワードを表示
                     self.revisible.toggle()
                     }) {
                         Image(systemName: self.revisible ? "eye.slash.fill": "eye.fill")
                             .foregroundColor(self.color)
                 }
             }
             .padding()
             .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("PinkRed") : self.color,lineWidth:  2))
             .padding(.top, 25)

              //登録ボタンアクション
                Button(action: {
                    self.register()
                }){
                    Text("登録")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                }
                .background(Color("PinkRed"))
                .cornerRadius(10)
                .padding(.top, 25)
                }
                .padding(.horizontal, 25)
                }
                
                Button(action: {
                    self.show.toggle()
                })  {
                   Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color("PinkRed"))
                }
            .padding()
            }
            
            if self.alert{
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
  //登録ボタンを押した時の処理
    func register(){
        if self.email != "" {
            
            if self.pass == self.repass{
                
                Auth.auth().createUser(withEmail: self.email, password: self.pass){
                    (res, err) in
                    
                    if err != nil{
                        self.error = ""
                        self.alert.toggle()
                        return
                    }
                    print("成功しました")
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
            else{
                self.error = "パスワードが一致していません"
                self.alert.toggle()
            }
        }
        else{
            self.error = "すべての項目を入力してください"
            self.alert.toggle()
        }
    }
}

//エラー処理
struct  ErrorView : View {
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        
        GeometryReader{_ in
            VStack{
                HStack{
                    Text(self.error == "REST" ? "Message" :"エラー")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "REST" ? "入力したメールアドレスにパスワードのリセットURLを送信しました" : self.error)
                    .padding(.horizontal, 25)
                    .padding(.top)
                    .padding(.horizontal,25)
                
                Button(action: {
                    //エラ-をキャンセルボタンで消す
                    self.alert.toggle()
                }) {
                    Text(self.error == "REST" ? "OK" : "戻る")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 120)
                }
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}


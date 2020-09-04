//
//  Homescreen.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/30.
//  Copyright © 2020 松岡奈央. All rights reserved.
//
import SwiftUI
import Firebase

struct Homescreen: View {
    @State var showingDetail = false
    var body: some View {
        //登録後の画面
        VStack{
            Text("こんにちは")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            
            Button(action: {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"),
                                                object: nil)
                
            }){
                Text("ログアウト")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 25)
        }
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}

//
//  ContentView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/25.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func  getUser(){
        session.listen()
    }
    
    var body: some View {
        Group{
            if(session.session != nil){
                Text("ようこそ")
                Button(action: session.singOut){
                    Text("ログアウト")
                }
            }   else {
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())

    }
}

//
//  HomeView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Button(action: session.singOut){
        Text("ログアウトする")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

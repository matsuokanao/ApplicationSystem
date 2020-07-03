//
//  UserSettingView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct UserSettingView: View {
    @ObservedObject var gameaList = ApplicationViewModel()
    
    @State var firstName = ""
    @State var rastName = ""
    
    
    var body: some View {
        Text("UserSettingView")
    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}

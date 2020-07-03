//
//  ApplicationRecordView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/03.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct ApplicationRecordView: View {
    @ObservedObject var gameaList = ApplicationViewModel()

    //種目
    @State var event = ""
    @State var sex = ""
    @State var showingDetail = false
    
    var body: some View {
        Text("aaa")
        
    }
}

struct ApplicationRecordView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationRecordView()
    }
}

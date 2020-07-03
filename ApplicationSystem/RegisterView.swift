//
//  RegisterView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct RegisterView: View {
    
    @ObservedObject var gameaList = ApplicationViewModel()
    @State var showingAlert = false
    @State var gamename = ""
    @State var gamedate = Date()
    @State var selected = 0
    var place = ["東京","神奈川","埼玉","千葉","香川"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("試合名")){
                    TextField("試合名を入力して下さい",text: $gamename)
                }
                Section(header: Text("試合日程")){
                    DatePicker(selection: $gamedate, displayedComponents: [.date],
                        label:{ Text("試合日程を入力して下さい")})
                }
                Section(header: Text("試合会場")){
                    Picker(selection: $selected, label: Text("都道府県を入力して下さい"))
                    {
                        ForEach(0..<place.count){
                            Text(self.place[$0])
                        }
                    }
                }
                Section{
                    Button(action: {
                        self.showingAlert = true
                    }){
                        Text("確定")
                    }.alert(isPresented: $showingAlert){
                        Alert(title: Text("確認"),
                            message:Text("試合を登録します。よろしいですか？"),
                            dismissButton:.default(Text("登録")))
                    }
                }
            }.navigationBarTitle("試合登録")
            .foregroundColor(Color("PinkRed"))
            Spacer()
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        
        RegisterView()
    }
}

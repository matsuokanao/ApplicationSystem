//
//  RegisterView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//
import SwiftUI
import SDWebImageSwiftUI
import Firebase
import FirebaseFirestore


struct RegisterView: View {
    
    @ObservedObject var gameaList = ApplicationViewModel()
    @State var show = false
    @State var gamename = ""
    @State var date = ""
    @State var place = ""
    @State var gamevenue = ""
    @State var png = ""
    @State var selected = 0
    
    var body: some View {
        
        NavigationView{
            NavigationLink(destination: RegisterCompleteView()){
            Form{
                Section(header: Text("試合名")){
                    TextField("試合名を入力して下さい",text: $gamename)
                }
                Section(header: Text("試合日程")){
                TextField("試合日を入力して下さい",text: $date)
                }
                Section(header: Text("都道府県　(例.東京都　神奈川県　大阪府)")){
                    TextField("試合名を入力して下さい",text: $place)
                }
                Section(header: Text("試合会場")){
                TextField("試合名を入力して下さい",text: $gamevenue)
                }
                
                Section(header: Text("試合要項（PDFファイルを貼って下さい）")){
                TextField("試合要項画像のURLをお貼り下さい",text: $png)
                }

                Section(header: Text("試合内容をご確認の上確定ボタンを押して下さい")){
                   // ForEach(self.gameaList.datas){i in
                    Button(action: {
                        self.gameaList.addGame(gamename: self.gamename, gamevenue: self.gamevenue, place: self.place, png: self.png, date: self.date)
    
                    }){
                        Text("確定")
                        }
                    }
                }
            }.navigationBarTitle("試合登録")
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        
        RegisterView()
    }
}

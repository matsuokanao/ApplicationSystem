//
//  InformationView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//
import SwiftUI
import FirebaseFirestore
import WebKit


struct InformationView: View {
    @State var color = Color.black.opacity(0.7)
    @ObservedObject var data = getCompleteData()
    @State var show = false
    @State var idmail = ""
    @State var pass = ""
    
    var body: some View {
        VStack{
            Spacer()
            Text("試合登録時に入力したメールアドレスとパスワードを入力して下さい")
                .foregroundColor(Color("PinkRed"))
            .fontWeight(.heavy)
                .font(.body)
            TextField("メールアドレスを入力して下さい", text: $idmail)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.idmail != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            TextField("パスワードを入力して下さい", text: $pass)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("PinkRed") : self.color,lineWidth:  2))

                    VStack{
                        List(self.data.datas,id: \.id){i in
                            CellInformationView(informationdata: i, data: self.idmail, passdata:self.pass)
                        
                        
                }
            }
        }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView()
    }
}


        
    


struct CellInformationView :View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    var informationdata : complete
    var data :String
    var passdata : String
    
    var body: some View {
        
        VStack{

            if informationdata.idEmail == data && informationdata.pass == passdata {
            VStack(alignment: .leading){
                Text(informationdata.completegamename)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color("PinkRed"))
            Text(informationdata.date).fontWeight(.heavy)
                .font(.body)
                .foregroundColor(Color("PinkRed"))
                    }
            Spacer()
        Button(action: {
            self.show.toggle()
                }) {
                                        
        Text("内容確認")
                .font(.body)
                .foregroundColor(Color("PinkRed"))
                .padding(14)
                }.sheet(isPresented: self.$show) {
                    CellInformationListView(informationdata: self.informationdata)
                }
            }
        }
    }
}
struct CellInformationListView : View {
    
var informationdata : complete
    
    var body: some View {
        
    VStack(alignment: .leading, spacing: 15){
        ScrollView(.vertical){
            WebView(loadUrl: self.informationdata.png).frame(height: 400)
        VStack{
        Group{
        Text("大会名")
        Text(informationdata.completegamename)
         
        Text("開催地")
        Text(informationdata.completeplace)
            
        Text("スタジアム")
        Text(informationdata.completegamevenue)
            
        Text("開催日")
        Text(informationdata.date)
            }
            Group{
        Text("エントリー種目")
            if informationdata.event1 == "なし" {
                Text(informationdata.event1)
                    } else {
            Text("")
            }
            
        Text("エントリー種目")
            if informationdata.event2 == "なし" {
                Text(informationdata.event2)
            } else {
                }
        Text("エントリー種目")
            if informationdata.event3 == "なし" {
                Text(informationdata.event3)
            } else {
                }
            Text("登録陸協")
                Text(informationdata.belongPrefecture)
                
            Text("登録チーム")
                Text(informationdata.belongTeam)
                    }
                }
            }
        }
    }
}

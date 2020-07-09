//
//  ApplicationView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import WebKit


struct ApplicationView: View {
    @ObservedObject var data = getGameData()
    @ObservedObject var userdata = getUserData()
    var body: some View {
                VStack{
            if self.data.datas.count != 0{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ForEach(self.data.datas){i in
                            CellViwe(data: i)
                                    
                        }
                    }.padding()
                }.background(Color("PinkRed"))
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
    }
}


struct CellViwe : View {

    @State var show = false
    var data : gamelist
    var body : some View{
        VStack{
                WebView(loadUrl: self.data.png).frame(height: 400)
            HStack{
                
                VStack(alignment: .leading){
                    Text(data.gamename).font(.title).fontWeight(.heavy)
                    Text(data.place).fontWeight(.heavy).font(.body)
                }
                Spacer()
                Button(action: {
                                    
            self.show.toggle()
                }) {
                                
        Image(systemName: "arrow.right")
            .font(.body)
            .foregroundColor(.black)
            .padding(14)
                            
        }.background(Color.yellow)
            .clipShape(Circle())
                            
        }.padding(.horizontal)
            .padding(.bottom,6)
                            
        }.background(Color.white)
        .cornerRadius(20)
        .sheet(isPresented: self.$show) {
          Spacer()
            ApplicationRecordView(data: self.data)
        }
    }
}
                

struct ApplicationRecordView : View {
    @ObservedObject var completedata = getCompleteData()
    @State var color = Color.black.opacity(0.7)
    var data : gamelist
    @State var cash = false
    @State var quick = false
    @State var quantity = 0
    @State var show = false
    @State var event1 = ""
    @State var event2 = ""
    @State var event3 = ""
    //メールアドレス(id)
    @State var idEmail = ""
    //名前
    @State var name : String = ""
    //性別
    @State var sex = ""
    //所属組織
    @State var belongTeam = ""
    //陸連
    @State var belongPrefecture = ""
    //登録番号
    @State var registrationnumber = ""
    //代表者名
    @State var representativeName = ""
    //住所
    @State var address = ""
    //電話番号
    @State var phonenumber = ""
    


    var body : some View{
        VStack(alignment: .leading, spacing: 15){
            WebView(loadUrl: self.data.png)
                .frame(height: UIScreen.main.bounds.height / 2 - 100)
            ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 25) {
                Group{
                Text("大会名")
                Text(data.gamename)
                Text("開催都道府県")
                Text(data.place)
                Text("大会会場")
                Text(data.gamevenue)
                }
                Group{
                Text("出場者名")
                TextField("出場者の名前を入力して下さい", text: $name)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.name != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    
                Text("性別（男か女でご記入ください）")
                TextField("出場者の性別を入力して下さい", text: $sex)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.sex != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    
                Text("所属組織（例　青山学院大学　高瀬高校　レジェンズ陸上クラブ）")
                TextField("所属組織を入力して下さい", text: $belongTeam)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.belongTeam != "" ? Color("PinkRed") : self.color,lineWidth:  2))

                Text("登録陸連　（例　東京陸協　香川陸協)")
                TextField("出場者の登録陸協を入力して下さい", text: $belongPrefecture)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.belongPrefecture != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    
                Text("登録番号　（半角数字で記入して下さい)")
                TextField("出場者の登録番号を入力して下さい", text: $registrationnumber)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.registrationnumber != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                

                    }
            Group{

                Text("代表者名")
                TextField("所属組織の代表者名を入力して下さい", text: $representativeName)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.representativeName != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                
                Text("住所")
                TextField("住所を入力して下さい", text: $address)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.address != "" ? Color("PinkRed") : self.color,lineWidth:  2))

                
                Text("電話番号")
                TextField("電話番号を入力して下さい", text: $phonenumber)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.phonenumber != "" ? Color("PinkRed") : self.color,lineWidth:  2))

                }
                
                Group{
                Text("出場種目を入力して下さい（登録可能種な種目数をご確認下さい）")
                TextField("1種目", text: $event1)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.event1 != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                
                TextField("2種目", text: $event2)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.event2 != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                
                TextField("3種目", text: $event3)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.event3 != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                }
                Text("最後にご確認のためご本人様のメールアドレスをご記入ください。　(必ず試合登録者と連絡の取れるメールアドレスを記入して下さい)")
                TextField("連絡の取れるメールアドレスをご記入ください", text: $idEmail)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.event3 != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                Button(action: {
                    self.show.toggle()
                    let db = Firestore.firestore()
                    //試合申し込み完了テーブルに入れる
                    db.collection("complete")
                        .document(self.idEmail)
                        .setData(["completegamename":self.data.gamename,"completegamevenue":self.data.gamevenue,"completeplace":self.data.place,"event1":self.event1,"event2":self.event2, "event3":self.event3, "name":self.name,"sex":self.sex, "belongTeam":self.belongTeam, "belongPrefecture": self.belongPrefecture, "registrationnumber": self.registrationnumber, "representativeName": self.representativeName, "address": self.address, "phonenumber": self.phonenumber, "idEmail": self.idEmail]) { (err) in
                            
            if err != nil{
                print((err?.localizedDescription)!)
                   return
                    }
                   }
                    
                }) {
                    Text("内容確認")
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .sheet(isPresented: $show){
                            CompleteView()

                    
                    }
                    
                }.background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(2)
                
            }.padding()
            
            Spacer()
            }
        }
    }
}




//WebKitの設定
struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}

    



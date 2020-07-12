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
            
            Image("miniview")
            .resizable()
            .frame(width: 100.0 , height: 70.0)
            Text("試合登録時に入力したメールアドレスとパスワードを入力して下さい")
                
            .fontWeight(.heavy)
            .font(.body)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
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
        }.frame(width: 300, height: 600)
        .lineSpacing(1) 
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

                Text(informationdata.gamedate).fontWeight(.heavy)
                .font(.body)
                
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
@State var show = false
@State var showingAlert = false
var informationdata : complete
@State var pay = "true"
    
    var body: some View {
        
    VStack(alignment: .leading, spacing: 15){
        ScrollView(.vertical){
            WebView(loadUrl: self.informationdata.png).frame(height: 400)
        VStack{
        Group{
        Text("大会名")
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 200,height: 30)
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 10)
            .lineSpacing(1)

        Text(informationdata.completegamename)
      
            
        Text("開催地")
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 200,height: 30)
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 10)
            .lineSpacing(1)
            
        Text(informationdata.completeplace)
            
        Text("スタジアム")
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 200,height: 30)
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 10)
            .lineSpacing(1)
            
        Text(informationdata.completegamevenue)
            
        Text("開催日")
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 200,height: 30)
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 10)
            .lineSpacing(1)
            
        Text(informationdata.gamedate)
            }
            Group{
        Text("エントリー種目")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 200,height: 30)
                .background(Color("PinkRed"))
                .cornerRadius(10)
                .padding(.top, 10)
                .lineSpacing(1)
                
            if informationdata.event1 != "なし" {
                Text(informationdata.event1)
                    } else {
            Text("")
            }
            
        Text("エントリー種目")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 200,height: 30)
                .background(Color("PinkRed"))
                .cornerRadius(10)
                .padding(.top, 10)
                .lineSpacing(1)
                
            if informationdata.event2 != "なし" {
                Text(informationdata.event2)
            } else {
                }
        Text("エントリー種目")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 200,height: 30)
                .background(Color("PinkRed"))
                .cornerRadius(10)
                .padding(.top, 10)
                .lineSpacing(1)
                
            if informationdata.event3 != "なし" {
                Text(informationdata.event3)
            } else {
                }
            Text("登録陸協")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 200,height: 30)
                .background(Color("PinkRed"))
                .cornerRadius(10)
                .padding(.top, 10)
                .lineSpacing(1)
                
                Text(informationdata.belongPrefecture)
                
            Text("登録チーム")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 200,height: 30)
                .background(Color("PinkRed"))
                .cornerRadius(10)
                .padding(.top, 10)
                .lineSpacing(1)
                
                Text(informationdata.belongTeam)
                    }
            
            
                if informationdata.pay == "false"{
                    
                
                Text("エントリー費用を申し込み済みの方は領収書の画像ファイルを指定のメールアドレスに送信し、「支払いが終了しました」ボタンをクリックして下さい！試合申込みが完了となります！")
                    .fontWeight(.heavy)
                    .font(.body)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)

                
                    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("complete")
                            .document(self.informationdata.idEmail)
                            .updateData(["pay": self.pay])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("支払いが終了しました。")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                CompleteView()
        }
    }.background(Color.red)
    .foregroundColor(.white)
    .cornerRadius(10)


            Button("エントリーを取り消す"){
                self.showingAlert = true

            }.alert(isPresented: $showingAlert){
                Alert(title: Text("注意"),
                      message: Text("エントリーを取り消します。よろしいですか？"),
                      primaryButton: .destructive(Text("エントリーを取り消す"),
                    action: {
                    self.show.toggle()
                    let db = Firestore.firestore()
                    //エントリー削除
                    db.collection("complete")
                        .document(self.informationdata.idEmail)
                        .delete()
                    { (err) in
                            
            if err != nil{
                print((err?.localizedDescription)!)
                   return
                            }
                        }
                      }),
                    secondaryButton: .cancel(Text("いいえ")))
                    }.sheet(isPresented: $show){
                            EntryView()
                        }
                    }else{
                    Text("試合費用の申込みが確認できました。")
                    }
                }
            }
        }.frame(width: 300, height: 600)
    }
}

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
    
    @ObservedObject var gameaList = getGameData()
    @State var gamename = ""
    @State var date = ""
    @State var place = ""
    @State var gamevenue = ""
    @State var png = ""
    @State var link = ""
    @State var sponsor = ""
    @State var gamepass = ""
    @State var email = ""
    @State var show = false
    @State var color = Color.black.opacity(0.7)
    
    var body: some View {
        VStack{
            ScrollView(.vertical){

            Group{
        Text("試合名")
        TextField("試合名を入力して下さい",text: $gamename)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.gamename != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            
        Text("試合日程")
        TextField("試合名を入力して下さい",text: $date)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.date != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
        Text("開催都道府県")
        TextField("都道府県を入力して下さい",text: $place)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.place != "" ? Color("PinkRed") : self.color,lineWidth:  2))

        Text("試合会場")
        TextField("試合会場を入力して下さい",text: $gamevenue)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.gamevenue != "" ? Color("PinkRed") : self.color,lineWidth:  2))

        Text("試合要項（PDFファイルを貼って下さい）")
        TextField("試合要項画像のPDFをお貼り下さい",text: $png)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.png != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            }
            
    Group{
        Text("大会ホームページのURLリンク")
        TextField("大会ホームページのURLリンクをお貼り下さい",text: $link)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.link != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
        Text("大会主催団体名")
        TextField("大会主催団体名を入力して下さい",text: $sponsor)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.sponsor != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
        Text("運営団体のパスワード")
        TextField("パスワードを入力して下さい",text: $gamepass)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.gamepass != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
        Text("運営団体連絡先メールアドレス")
        TextField("連絡先メールアドレスを入力して下さい",text: $email)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("PinkRed") : self.color,lineWidth:  2))


            }
    Button(action: {
        self.show.toggle()
                        
        let db = Firestore.firestore()
        //試合申し込み完了テーブルに入れる
        db.collection("gamelist")
            .document(self.email)
            .setData(["gamename":self.gamename,"gamepass":self.gamepass,"gamevenue":self.gamevenue,"date":self.date,"email":self.email,"link":self.link, "place":self.place, "png":self.png,"sponsor":self.sponsor])
                    { (err) in
                                        
                        if err != nil{
                            print((err?.localizedDescription)!)
                               return
                                }
                            }
                        }){
                        Text("確定")
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 30)
                                .sheet(isPresented: $show){
                                    RegisterCompleteView()
                            }
            }.background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            }
        }.frame(width: 300, height: 600)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        
        RegisterView()
    }
}

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
    @State var gamename = ""
    @State var date = ""
    @State var place = ""
    @State var gamevenue = ""
    @State var png = ""
    @State var show = false
    @State var color = Color.black.opacity(0.7)
    
    var body: some View {
        VStack{
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
        TextField("試合要項画像のURLをお貼り下さい",text: $png)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.png != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            }

                    Button(action: {
                        self.show.toggle()
                                //試合申し込み完了テーブルに入れる
                           self.gameaList.addGame(gamename: self.gamename, gamevenue: self.gamevenue, place: self.place, png: self.png, date: self.date)

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

            }.frame(width: 300, height: 600)
            
        }
    }

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        
        RegisterView()
    }
}

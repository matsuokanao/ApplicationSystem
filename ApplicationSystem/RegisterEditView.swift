//
//  RegisterEditView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/13.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RegisterEditView: View {
    
    @State var color = Color.black.opacity(0.7)
    @ObservedObject var data = getGameData()
    @State var show = false
    @State var email = ""
    @State var pass = ""
    
    var body: some View {
        VStack{
            Group{
                Image("miniview")
                    .resizable()
                    .frame(width: 100.0 , height: 70.0)
                Text("運営団体のメールアドレスとパスワードを入力して下さい")
                    .fontWeight(.heavy)
                    .font(.body)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 40)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
                TextField("メールアドレスを入力して下さい", text: $email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                TextField("パスワードを入力して下さい", text: $pass)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            }
            
            VStack{
                List(self.data.datas,id: \.id){i in
                    CellRegisterEditView(editdata: i, data: self.email, passdata:self.pass)
                    
                }
            }
        }.frame(width: 300, height: 600)
            .lineSpacing(1)
    }
}


struct RegisterEditView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEditView()
    }
}




struct CellRegisterEditView: View {
    
    @State var color = Color.black.opacity(0.7)
    var  editdata : gamelist
    var data :String
    var passdata : String
    @State var show = false
    
    var body: some View {
        VStack{
            if editdata.email == data && editdata.gamepass == passdata {
                VStack(alignment: .leading){
                    Text(editdata.gamename)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text(editdata.date).fontWeight(.heavy)
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
                    CellEditView(editdata: self.editdata, data: self.data, passdata: self.passdata)
                }
            }
        }
    }
}

struct CellEditView: View {
    
    @State var color = Color.black.opacity(0.7)
    var  editdata : gamelist
    var data :String
    var passdata : String
    @State var gamenameshow = false
    @State var dateshow = false
    @State var placeshow = false
    @State var gamevenueshow = false
    @State var linkshow = false
    @State var sponsorshow = false
    @State var gamepassshow = false
    @State var emailshow = false
    @State var pngshow = false
    
    var body: some View {
        
        
        VStack{
            ScrollView(.vertical){
                
                Group{
                    Text("試合名")
                    HStack{
                        Text(editdata.gamename)
                        Button(action: {
                            self.gamenameshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $gamenameshow){
                                    EditGamenameData(editdata: self.editdata)
                            }
                        }
                    }
                    
                    Text("試合日程")
                    HStack{
                        Text(editdata.date)
                        Button(action: {
                            self.dateshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $dateshow){
                                    EditDateData(editdata: self.editdata)
                            }
                        }
                    }
                    Text("開催都道府県")
                    HStack{
                        Text(editdata.place)
                        Button(action: {
                            self.placeshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $placeshow){
                                    EditPlaceData(editdata: self.editdata)
                            }
                        }
                    }
                    
                    Text("試合会場")
                    HStack{
                        Text(editdata.gamevenue)
                        Button(action: {
                            self.gamevenueshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $gamevenueshow){
                                    EditGamevenueData(editdata: self.editdata)
                            }
                        }
                    }
                }
                
                Group{
                    Text("大会ホームページのURLリンク")
                    HStack{
                        Text(editdata.link)
                        Button(action: {
                            self.linkshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $linkshow){
                                    EditLinkData(editdata: self.editdata)
                            }
                        }
                    }
                    
                    Text("大会主催団体名")
                    HStack{
                        Text(editdata.sponsor)
                        Button(action: {
                            self.sponsorshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $sponsorshow){
                                    EditSponsorData(editdata: self.editdata)
                            }
                        }
                    }
                    
                    Text("運営団体のパスワード")
                    HStack{
                        Text(editdata.gamepass)
                        Button(action: {
                            self.gamepassshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $gamepassshow){
                                    EditgamePassData(editdata: self.editdata)
                            }
                        }
                    }
                    
                    Text("運営団体連絡先メールアドレス")
                    HStack{
                        Text(editdata.email)
                        Button(action: {
                            self.emailshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $emailshow){
                                    EditEmailData(editdata: self.editdata)
                            }
                        }
                    }
                    
                    Text("PDFファイル")
                    HStack{
                        Text(editdata.png)
                        Button(action: {
                            self.pngshow.toggle()
                        }){
                            Text("編集")
                                .sheet(isPresented: $pngshow){
                                    EditPngData(editdata: self.editdata)
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

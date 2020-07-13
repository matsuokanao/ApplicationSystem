//
//  EditData.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/13.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct EditData: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EditData_Previews: PreviewProvider {
    static var previews: some View {
        EditData()
    }
}

struct EditGamenameData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var gamename = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後の試合名を入力して下さい")
        TextField("試合名", text: $gamename)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.gamename != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["gamename": self.gamename])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}




struct EditDateData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var date = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後の試合日程を入力して下さい")
        TextField("試合日程", text: $date)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.date != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["date": self.date])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct EditGamevenueData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var gamevenue = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後の試合会場を入力して下さい")
        TextField("試合会場", text: $gamevenue)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.gamevenue != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["gamevenue": self.gamevenue])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct EditPlaceData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var place = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後の開催都道府県を入力して下さい")
        TextField("都道府県", text: $place)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.place != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["place": self.place])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct EditLinkData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var link = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後の大会ホームページリンクを入力して下さい")
        TextField("リンク", text: $link)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.link != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["link": self.link])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct EditSponsorData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var sponsor = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後の大会主催団体名を入力して下さい")
        TextField("大会主催団体名", text: $sponsor)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.sponsor != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["sponsor": self.sponsor])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct EditgamePassData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var gamepass = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後の大会パスワードを入力して下さい")
        TextField("パスワード", text: $gamepass)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.gamepass != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["gamepass": self.gamepass])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct EditEmailData: View {
        @State var color = Color.black.opacity(0.7)
        @State var show = false
        @State var email = ""
        var  editdata : gamelist
        
    var body: some View {
        VStack{
            
            Text("変更後の大会パスワードを入力して下さい")
            TextField("パスワード", text: $email)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            
        Button(action: {
                            self.show.toggle()
                            let db = Firestore.firestore()
                            //試合申し込み完了テーブルに入れる
                            db.collection("gamelist")
                                .document(self.editdata.email)
                                .updateData(["email": self.email])
                        { (err) in
                                    
                if err != nil{
                        print((err?.localizedDescription)!)
                           return
                            }
                        }
                }) {
            Text("編集を完了する")
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .sheet(isPresented: $show){
                    EditView()
                    }
                }.background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

struct EditPngData: View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    @State var png = ""
    var  editdata : gamelist
    
var body: some View {
    VStack{
        
        Text("変更後のPDFファイルを入力して下さい")
        TextField("PDFファイル", text: $png)
            .padding()
            .background(RoundedRectangle(cornerRadius: 4).stroke(self.png != "" ? Color("PinkRed") : self.color,lineWidth:  2))
        
    Button(action: {
                        self.show.toggle()
                        let db = Firestore.firestore()
                        //試合申し込み完了テーブルに入れる
                        db.collection("gamelist")
                            .document(self.editdata.email)
                            .updateData(["png": self.png])
                    { (err) in
                                
            if err != nil{
                    print((err?.localizedDescription)!)
                       return
                        }
                    }
            }) {
        Text("編集を完了する")
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .sheet(isPresented: $show){
                EditView()
                }
            }.background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}



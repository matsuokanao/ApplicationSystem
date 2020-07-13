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
Text("")
                }
            }
        }
    }
}

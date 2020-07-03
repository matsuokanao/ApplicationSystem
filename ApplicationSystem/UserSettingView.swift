//
//  UserSettingView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct UserSettingView: View {
    @ObservedObject var gameaList = ApplicationViewModel()
    
    @State var color = Color.black.opacity(0.7)
    @State var firstName = ""
    @State var lastName = ""
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
    //メールアドレス
    @State var mails = ""
    

    
    
    var body: some View {
        
        ScrollView(.vertical){
        ZStack{
        ZStack(alignment: .topLeading) {
            GeometryReader{_ in
        
        VStack{
            Text("個人情報登録")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.color)
            Text("名前")
                .foregroundColor(self.color)
                .padding(.top, 30)
            
            HStack{
            TextField("名字", text: self.$firstName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.firstName != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                            
            TextField("名前", text: self.$lastName)
                 .padding()
                 .background(RoundedRectangle(cornerRadius: 4).stroke(self.lastName != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            }
                
                VStack{
                Text("所属組織名")
                    TextField("所属組織を入力して下さい", text: self.$belongTeam)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.belongTeam != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    
                    Text("登録陸協")
                        TextField("登録陸協を入力して下さい", text: self.$belongPrefecture)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.belongPrefecture != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                            
                    Text("代表者名(所属組織)")
                        TextField("代表者の名前を入力して下さい", text: self.$representativeName)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.representativeName != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    
                    Group {
                    Text("住所　--郵便番号から入力しください--")
                        TextField("住所を入力して下さい", text: self.$address)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.address != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                    Text("電話番号")
                        TextField("住所をを入力して下さい", text: self.$phonenumber)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.phonenumber != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                
                    Text("メールアドレス")
                        TextField("メールアドレスを入力して下さい", text: self.$mails)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.mails != "" ? Color("PinkRed") : self.color,lineWidth:  2))
                                }

                            }
                        }
                    }
                }
            }
        }
    }
}

struct UserSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingView()
    }
}
        

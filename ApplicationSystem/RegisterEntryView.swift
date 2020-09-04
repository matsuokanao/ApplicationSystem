//
//  RegisterEntryView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/12.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RegisterEntryView: View {
    @State var color = Color.black.opacity(0.7)
    @ObservedObject var data = getCompleteData()
    @State var show = false
    @State var email = ""
    @State var pass = ""
    
    var body: some View {
        VStack{
            
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
            
            VStack{
                List(self.data.datas,id: \.id){i in
                    CellRegisterView(registerdata: i, data: self.email, passdata:self.pass)
                    
                }
            }
        }.frame(width: 300, height: 600)
            .lineSpacing(1)
    }
}

struct RegisterEntryView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEntryView()
    }
}

struct CellRegisterView :View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    var registerdata : complete
    var data :String
    var passdata : String
    
    var body: some View {
        
        VStack{
            
            if registerdata.gameemail == data && registerdata.gamepass == passdata {
                VStack(alignment: .leading){
                    Text(registerdata.completegamename)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Text(registerdata.gamedate).fontWeight(.heavy)
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
                    CellRegisteListView(registerdata: self.registerdata)
                }
            }
        }
    }
}

struct CellRegisteListView :View {
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    var registerdata : complete
    @State var list = ["男子100m","男子200m","男子走り幅跳び","男子砲丸投げ","女子100m","女子200m","女子走幅り跳び","女子砲丸投げ"]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(list,id: \.self){ list in
                    NavigationLink(destination: RegisteListView(registerlist: list, registerdata: self.registerdata)){
                        Text(list)
                    }
                }
            }
        }
    }
}


struct RegisteListView :View {
    var registerlist : String
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    var registerdata : complete
    
    var body: some View {
        NavigationView{
            List{
                HStack(spacing: 100){
                    Text("出場者名")
                    Text("所属")
                }
                if registerdata.event1 == registerlist
                    || registerdata.event2 == registerlist
                    || registerdata.event3 == registerlist  {
                    HStack(spacing: 170){
                        Text(registerdata.name)
                        Text(registerdata.belongTeam)
                    }
                }
            }.navigationBarTitle(registerlist)
        }
    }
}

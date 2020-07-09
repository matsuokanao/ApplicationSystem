//
//  InformationView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//
import SwiftUI
import FirebaseFirestore


struct InformationView: View {
    @State var color = Color.black.opacity(0.7)
    @ObservedObject var data = getCompleteData()
    @State var show = false
    @State var idmail = ""
    var body: some View {
        VStack{
            Text("試合登録時に入力したメールアドレスを入力して下さい")
            TextField("メールアドレスを入力して下さい", text: $idmail)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.idmail != "" ? Color("PinkRed") : self.color,lineWidth:  2))

                    VStack{
                        List(self.data.datas,id: \.id){i in
                            CellInformationView(informationdata: i, data: self.idmail)
                        
                        
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
    
    var body: some View {
        
        VStack{

            if informationdata.idEmail == data {
            VStack(alignment: .leading){
            Text(informationdata.name).font(.title).fontWeight(.heavy)
            Text(informationdata.representativeName).fontWeight(.heavy).font(.body)
                    }
            Spacer()
        Button(action: {
            self.show.toggle()
                }) {
                                        
        Text("確認する")
                .font(.body)
                .foregroundColor(.black)
                .padding(14)
                }
            }
        }
    }
}

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
    @ObservedObject var data = getCompleteData()

    var body: some View {
        VStack{
            if self.data.datas.count != 0{
                ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ForEach(self.data.datas,id: \.id){i in
                       Securitys(informationdata: i)
                        }
                    }
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

struct Securitys: View{
    @State var color = Color.black.opacity(0.7)
    @State var show = false
    var informationdata : complete
    @State var idemail = ""
    var body: some View {
      
        VStack{
                  Text("所属組織名")
                  TextField("所属組織を入力して下さい", text: $idemail)
                      .padding()
                      .background(RoundedRectangle(cornerRadius: 4).stroke(self.idemail != "" ? Color("PinkRed") : self.color,lineWidth:  2))
            Button(action: {
                                        
                self.show.toggle()
                    }) {
                                    
            Image(systemName: "arrow.right")
                .font(.body)
                .foregroundColor(.black)
                .padding(14)
                                
            }.background(Color.yellow)
                .clipShape(Circle())
                                
            .padding(.horizontal)
                .padding(.bottom,6)
    
    .background(Color.white)
    .sheet(isPresented: self.$show){
        if self.informationdata.idEmail == self.idemail{
    CellInformationView(informationdata: self.informationdata)
              Spacer()
            }
            }
        }
    }
}
        
    


struct CellInformationView :View {
    var informationdata : complete
    @State var show = false
    var idmail = ""
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
            Text(informationdata.name).font(.title).fontWeight(.heavy)
            Text(informationdata.representativeName).fontWeight(.heavy).font(.body)
                    }
            Spacer()
        Button(action: {
            self.show.toggle()
                }) {
                                        
        Image(systemName: "arrow.right")
                .font(.body)
                .foregroundColor(.black)
                .padding(14)
            }
        }
    }
}

//
//  ApplicationView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ApplicationView: View {
    @ObservedObject var gameaList = ApplicationViewModel()
    
    var body: some View {
        VStack{
            if self.gameaList.datas.count != 0{
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ForEach(self.gameaList.datas){i in
                            CellViwe(data: i)
                        }
                    }.padding()
                }.background(Color("PinkRed"))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationView()
    }
}

struct CellViwe : View {
    @State var showingDetail = false
    var data : gamelist
    var body : some View{
        VStack{
            AnimatedImage(url: URL(string: data.png)!).resizable().frame(height: 400)
            
            HStack{
                VStack(alignment: .leading){
                    Text(data.gamename).font(.title).fontWeight(.heavy)
                    Text(data.place).fontWeight(.heavy).font(.body)
                }
                Spacer()
                Button(action: {
                    self.showingDetail.toggle()
                }){
                    Image(systemName: "arrow.right").font(.body)
                        .foregroundColor(.black).padding(14)
                }.sheet(isPresented: $showingDetail){
                UserSettingView()
                }
                .background(Color("PinkRed"))
                .clipShape(Circle())
                
            }.padding(.horizontal)
                .padding(.bottom,6)
            
        }.background(Color.white)
    }
}



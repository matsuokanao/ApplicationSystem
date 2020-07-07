//
//  ApplicationView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import FirebaseFirestore

struct ApplicationView: View {
    @ObservedObject var data = getData()
    var body: some View {
        VStack{
                    if self.data.datas.count != 0{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack{
                                ForEach(self.data.datas){i in
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
    @State var show = false
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
                                    
            self.show.toggle()
                }) {
                                
        Image(systemName: "arrow.right")
            .font(.body)
            .foregroundColor(.black)
            .padding(14)
                            
        }.background(Color.yellow)
            .clipShape(Circle())
                            
        }.padding(.horizontal)
            .padding(.bottom,6)
                            
        }.background(Color.white)
        .cornerRadius(20)
        .sheet(isPresented: self.$show) {
                                
        ApplicationRecordView()
        }
    }
}
                


class getData : ObservableObject{
    
    @Published var datas = [gamelist]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("gamelist").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let id = i.documentID
                let gamename = i.get("gamename") as! String
                let gamevenue = i.get("gamevenue") as! String
                let place = i.get("place") as! String
                let png = i.get("png") as! String
                
                self.datas.append(gamelist(id: id, gamename: gamename, gamevenue: gamevenue, place: place, png: png))
            }
        }
    }
}


struct gamelist: Identifiable {
    var id: String
    var gamename: String
    var gamevenue: String
    var place: String
    var png: String
    
        }


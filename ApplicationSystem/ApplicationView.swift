//
//  ApplicationView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import WebKit


struct ApplicationView: View {
    @ObservedObject var data = getGameData()
    @ObservedObject var userdata = getUserData()
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
                WebView(loadUrl: self.data.png).frame(height: 400)
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
          Spacer()
            ApplicationRecordView(data: self.data)
        }
    }
}
                

struct ApplicationRecordView : View {
    
    var data : gamelist
    @State var cash = false
    @State var quick = false
    @State var quantity = 0
    @Environment(\.presentationMode) var presentation
    @State var show = false
    
    var body : some View{
        VStack(alignment: .leading, spacing: 15){
            WebView(loadUrl: self.data.png)
                .frame(height: UIScreen.main.bounds.height / 2 - 100)
            
            VStack(alignment: .leading, spacing: 25) {

                Text(data.gamename).fontWeight(.heavy).font(.title)
                Text(data.place).fontWeight(.heavy).font(.body)

                Toggle(isOn : $quick){
                    
                    Text("Quick Delivery")
                }
                
                Stepper(onIncrement: {
                    
                    self.quantity += 1
                    
                }, onDecrement: {
                
                    if self.quantity != 0{
                        
                        self.quantity -= 1
                    }
                }) {
                    
                    Text("Quantity \(self.quantity)")
                }
                
                Button(action: {
                    self.show.toggle()
                    let db = Firestore.firestore()
                    //試合申し込み完了テーブルに入れる
                    db.collection("complete")
                        .document()
                        .setData(["item":self.data.gamename,"quantity":self.quantity,"quickdelivery":self.quick,"cashondelivery":self.cash,"pic":self.data.place]) { (err) in
                            
            if err != nil{
                print((err?.localizedDescription)!)
                    return
                    }
            //it will dismiss the recently presented modal....
                self.presentation.wrappedValue.dismiss()
                   }
                    
                    
                }) {
                    Text("内容確認")
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .sheet(isPresented: $show){
                            CompleteView()

                    
                    }
                    
                }.background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(20)
                
            }.padding()
            
            Spacer()
            
        }
    }
}




//WebKitの設定
struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}

    


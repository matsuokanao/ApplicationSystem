//
//  CompleteView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct CompleteView: View {
    
    @State var show = false
    
    var body: some View {
        VStack(spacing:10){
            
            Image("completeview")
                .resizable()
                .frame(width: 300.0 , height: 220.0)
            Spacer().frame(height: 15)
            
            Text("エントリーを申し込みました!エントリー費用をお支払いください！")
                .foregroundColor(.orange)
                .fontWeight(.heavy)
                .font(.headline)
            
            Text("・エントリータブにてエントリー内容をご確認し、入金期限までに入金をお済ませ下さい。")
            Text("・入金が完了次第エントリー完了となります。")
            Text("・入金が確認できない場合は自動キャンセルとなりますのでご注意下さい。")
            Text("・入金前の段階ではエントリー内容の変更、キャンセルが可能です。")
            
            Button(action: {
                
                //HOME画面遷移
                UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
            } ){
                Text("HOME画面に移動する")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }.background(Color("PinkRed"))
                .cornerRadius(10)
                .padding(.top, 25)
            
        }.frame(width: 300, height: 600)
            .lineSpacing(1)
        
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}

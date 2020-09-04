//
//  EditView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/13.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct EditView: View {
    @State var show = false
    
    var body: some View {
        VStack(spacing:10){
            
            
            Image("editview")
                .resizable()
                .frame(width: 300.0 , height: 220.0)
            Spacer().frame(height: 15)
            
            Text("試合内容が変更されました！")
                .foregroundColor(.orange)
                .fontWeight(.heavy)
                .font(.headline)
            
            
            Text("・変更が反映されるまで時間がかかる場合があります。")
            Text("・お手数ですが一度アプリケーションを閉じてお確かめ下さい。")
            
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

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}

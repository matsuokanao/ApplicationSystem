//
//  RegisterCompleteView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/11.
//  Copyright © 2020 松岡奈央. All rights reserved.
//
import SwiftUI

struct RegisterCompleteView: View {
    
    
    var body: some View {
        VStack(spacing:10){
            Image("registerview")
                .resizable()
                .frame(width: 300.0 , height: 220.0)
                    Spacer().frame(height: 15)
                    
            Text("試合の登録が完了しました!")
                .foregroundColor(.orange)
                .fontWeight(.heavy)
                .font(.headline)


            Text("ご登録ありがとうございます。")
            Text("・「試合に申し込む」タブにて試合の詳細内容をご確認下さい。")
            Text("・試合内容に変更等御座いましたら修正を行って下さい。")
                
            Button(action: {
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


struct RegisterCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterCompleteView()
    }
}

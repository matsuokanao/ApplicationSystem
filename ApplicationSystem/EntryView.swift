//
//  EntryView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/12.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct EntryView: View {
    @State var show = false
        
        var body: some View {
            VStack(spacing:10){
                

            Image("entryview")
            .resizable()
            .frame(width: 300.0 , height: 220.0)
                Spacer().frame(height: 15)
                
            Text("エントリーの最終承認が完了しました!")
                .foregroundColor(.orange)
                .fontWeight(.heavy)
                .font(.headline)


            Text("最終エントリーが完了しました。")
            Text("・タイムテーブルはエントリータブに記載されますのでご確認下さい。")
            Text("・大会日時や内容等に変更がある場合があります。ご注意下さい。")
            Text("・登録内容に不備等御座いましたら連絡をさせて頂く場合があります。")
            Text("頑張って下さい！！！")
            
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

struct EntryView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView()
    }
}

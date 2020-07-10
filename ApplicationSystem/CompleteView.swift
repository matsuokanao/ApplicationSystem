//
//  CompleteView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/08.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct CompleteView: View {
    var body: some View {
        VStack(spacing:10){
            

        Image("entryview")
        .resizable()
        .frame(width: 300.0 , height: 220.0)
            Spacer().frame(height: 15)
            
        Text("エントリーが完了しました！")
            .foregroundColor(.orange)
            .fontWeight(.heavy)
            .font(.headline)


        Text("・エントリータブにてエントリー内容をご確認し、入金期限までに入金をお済ませ下さい。")
        Text("・入金が確認できない場合は自動キャンセルとなりますのでご注意下さい。")
        Text("・入金前の段階ではエントリー内容の変更、キャンセルが可能です。")
        Text("頑張って下さい！！！")
        }.frame(width: 300, height: 600)
        .lineSpacing(10)
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}

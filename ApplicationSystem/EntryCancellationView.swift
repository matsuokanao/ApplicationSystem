//
//  EntryCancellationView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/12.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct EntryCancellationView: View {
    @State var show = false
    
    var body: some View {
        VStack{
            Image("cancelview")
                .resizable()
                .frame(width: 300.0 , height: 220.0)
                Spacer().frame(height: 15)
            
        Text("試合のエントリーをキャンセルしました!")
            .foregroundColor(.orange)
            .fontWeight(.heavy)
            .font(.headline)


        Text("・エントリータブにてエントリー内容をご確認下さい。")
        Text("・不具合、ご質問等御座いましたらご連絡下さい。")
        
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

struct EntryCancellationView_Previews: PreviewProvider {
    static var previews: some View {
        EntryCancellationView()
    }
}

//
//  DiaryView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI


struct DiaryView: View {
    //IOS13の公式エラーのため使えない　@ObservedObject var diaryList = DiaryViewModel()
    //代わりに@EnvironmentObjectを使う
    @EnvironmentObject var diaryList : DiaryViewModel
    
    var body: some View {
        
        VStack(spacing: 0){
            HStack{
                Text("日記").font(.title)
                .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    //削除
                }){
                    Image(systemName: "trash").resizable().frame(width: 23, height: 23).foregroundColor(.white)
                }
            }.padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.red)
            
            if self.diaryList.datas.isEmpty{
                if self.diaryList.noDate{
                    Spacer()
                    Text("日記がありません")
                    Spacer()
                } else {
                    Spacer()
                    //Text("日記がありません")
                    Spacer()

                }
            }
            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        //IOS13の公式エラーのため使えない .environmentObject(DiaryViewModel())
        DiaryView().environmentObject(DiaryViewModel())
    }
}




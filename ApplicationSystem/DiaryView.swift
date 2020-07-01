//
//  DiaryView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/06/30.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI


struct DiaryView: View {
@ObservedObject var Diary = getDiary()

    var body: some View {
        
        VStack(spacing: 0){
            HStack{
                Text("日記").font(.title).foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                }){
                    Image(systemName: "trash").resizable().frame(width: 23, height: 23).foregroundColor(.white)
                }
            }.padding()
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.red)
            
            if self.Diary.date.isEmpty{
                if self.Diary.noDate{
                    Spacer()
                    Text("日記がありません")
                    Spacer()
                }else{
                    Spacer()
                    //Indicator()
                    Spacer()

                }
            }
        
        else{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ForEach(self.Diary.date){i in
                        Text(i.date)
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}


struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}








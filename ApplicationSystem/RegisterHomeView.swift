//
//  RegisterHomeView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/12.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RegisterHomeView: View {
    @State var show = false
      @State var shows = false
    
    var body: some View {
        VStack{
    
    Button(action: {
        
            self.show.toggle()
        }){
            Text("試合を登録する")
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
        }
        .background(Color("PinkRed"))
        .cornerRadius(10)
        .padding(.top, 25)
        .sheet(isPresented: self.$show) {
        Spacer()
        RegisterView()

        }
        
        Button(action: {
            
                self.shows.toggle()
            }){
                Text("試合のエントリーリストを見る")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(Color("PinkRed"))
            .cornerRadius(10)
            .padding(.top, 25)
            .sheet(isPresented: self.$shows) {
            Spacer()
            RegisterEntryView()
            }
        }
    }
}

struct RegisterHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterHomeView()
    }
}

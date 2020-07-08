//
//  CompleteView.swift
//  ApplicationSystem
//
//  Created by 松岡奈央 on 2020/07/07.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct CompleteView: View {
@ObservedObject var userdata = getUserData()
    
    var body: some View {
            VStack{
                if self.userdata.userdatas.count != 0{
                    ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        ForEach(self.userdata.userdatas,id: \.id){i in
                CellCompleteView(userdatad: i)
                                        
                    }
                }.padding()
            }.background(Color("PinkRed"))
            .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

    

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}

struct CellCompleteView :View {
    var userdatad : userlist
    var body: some View {
        Text(userdatad.firstname)
    }
}

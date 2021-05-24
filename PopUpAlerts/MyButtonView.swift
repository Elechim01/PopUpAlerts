//
//  MyButtonView.swift
//  PopUpAlerts
//
//  Created by Michele Manniello on 24/05/21.
//

import SwiftUI
import SSToastMessage
struct MyButtonView: View {
    @Binding var showing : Bool
    var title : String
    var hideAll : () -> ()
    
    var body: some View {
        Button(action: {
            self.hideAll()
            self.showing.toggle()
        }, label: {
            Text(title)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(.black)
        })
    }
}

struct MyButtonView_Previews: PreviewProvider {
     @State static var trovato : Bool = false
     @State static var titolo : String = "ciao"
    static func hola (){}
    static var previews: some View {
        MyButtonView(showing: $trovato, title: titolo, hideAll: hola)
    }
}

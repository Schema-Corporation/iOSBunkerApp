//
//  ConfigurationView.swift
//  iBunker
//
//  Created by Developer on 10/18/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct ConfigurationView: View {
    
    //var user: UserDTO
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            CircleImage(image: Image("user-icon")).padding(EdgeInsets(top:0, leading:50, bottom: 100, trailing: 0))
            
            //Text("Sample username").offset(x:30, y:-210)
            
            HStack{
                Image(systemName: "book")
                Text("Términos y Condiciones").padding(.leading, 20)
                Spacer()
            }.padding(EdgeInsets(top:40, leading:50, bottom: 40, trailing: 90))
            
            //Rectangle().frame(height:1).foregroundColor(.gray)
            
            HStack{
                Image(systemName: "plus.square")
                Text("Agregar un Espacio").padding(.leading, 20)
                Spacer()
            }.padding(EdgeInsets(top:40, leading:50, bottom: 40, trailing: 90))
            
            
            
            HStack{
                Image(systemName: "power")
                Text("Cerrar Sesión").padding(.leading, 20)
                Spacer()
            }.padding(EdgeInsets(top:40, leading:50, bottom: 40, trailing: 90))
            
        }
        
        
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}

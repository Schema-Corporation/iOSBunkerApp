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
        
        VStack {
            
            CircleImage(image: Image("user-icon")).offset(x:-110, y:-130)
            
            //Text("Sample username").offset(x:30, y:-210)
            
            HStack{
                Image(systemName: "book")
                Text("Términos y Condiciones")
            }
            HStack{
                Image(systemName: "plus.square")
                Text("Agregar un Espacio")
            }
            HStack{
                Image(systemName: "power")
                Text("Cerrar Sesión")
            }
        }
        
        
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}

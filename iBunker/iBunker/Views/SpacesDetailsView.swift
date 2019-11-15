//
//  SpacesDetailsView.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import Firebase

struct SpacesDetailsView: View {
    var space: SpaceViewModel
 
 
    
    var body: some View {
        VStack(alignment: .leading){
                         
                ImageView(withURL: space.first_photo).frame(minWidth:0, maxWidth: .infinity)
                  HStack {
                    Text(space.title).font(.title).bold().padding(.leading,70).padding(.trailing,20)
                  }
            
                  HStack{
                    Text("\(space.address)").padding(.leading,30)
                  }.padding()
                  HStack{
                    Text("Medidas del espacio: ").bold().padding(.leading,10)
                  }
                  HStack{
                    Text("Largo: " + space.height + " m")
            
                        VStack{
                          Text("Área: " + space.width + " m²" )
                        }
                  }
                  HStack{
                    Text("Ancho: " + space.width + " m")
                  }

                 Spacer()
         
               
            
//            VStack(alignment: .leading) {
//                  HStack{
//                    Text("Medidas del espacio: ").bold()
//                    }
//            }
//
//                  HStack{
//                    Text("Largo: " + space.height + " m")
//
//                    VStack{
//                        Text("Área: " + space.width + " m²" )
//                    }
//                  }
//                  HStack{
//                    Text("Ancho: " + space.width + " m")
//                  }
//
//
//                  HStack {
//                    Text("Descripción del espacio: ").bold()
//                  }
//                  VStack{
//                    Text("\(space.description)")
//                  }
//                  HStack {
//                    Text("Servicios disponibles:").bold()
//                  }
//                  VStack(alignment: .center){
//                   // Spacer(minLength: 25)
//                    HStack{
//                       //Spacer()
//                          //Spacer(minLength: 1)
//                        Image("wifi")
//                        Image("wifi")
//                        Image("wifi")
//                        Image("wifi")
//                        Image("wifi")
//                        Image("wifi")
//
//                    }
//                                      }
//                  HStack {
//                    Text("Precio: ").bold()
//                    Text("$/\(space.rent_price)")
//                  }
//
                 
            
              
            

        }.navigationBarTitle(" Detalles del Espacio", displayMode: .inline)
         .navigationBarItems(
        //                 leading: Button(action: {
        //                     // Actions
        //                 }, label: { Text("Button") }),

                         trailing: NavigationLink(destination: BookingProcessStepOneView(space: self.space)) {
                         Text("Solicitar") } )
        
        
    }
}
    


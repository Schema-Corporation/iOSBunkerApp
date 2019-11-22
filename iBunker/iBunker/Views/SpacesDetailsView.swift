//
//  SpacesDetailsView.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import Firebase

class OperationStatus: ObservableObject {
    @Published var status: Int = 0
}
struct SpacesDetailsView: View {
    
    var space: SpaceViewModel

    @State private var ref: DatabaseReference! = Database.database().reference()
    
    @State var shouldShowOnboarding: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var operation = OperationStatus()
    @State var shouldClose: Bool = false
 
    
    var body: some View {
        VStack(alignment: .leading){
                         
                  ImageView(withURL: space.first_photo).frame(minWidth:0, maxWidth: .infinity)

            HStack {
                    Text(space.title).font(.title).bold().padding(.leading,70).padding(.trailing,20)
                  }
            
                  HStack{
                    Text("\(space.address)").padding(.leading,25)
                  }.padding()
                  HStack{
                    Text("Medidas del espacio: ").bold().padding(.leading,20)
                  }.padding()
                  HStack{
                    Text("Largo: " + space.height + " m").padding(.leading,90)
                        VStack{
                          Text("Área: " + space.width + " m²" )
                        }
                  }
                  HStack{
                    Text("Ancho: " + space.width + " m").padding(.leading,90)
                  }

                  HStack {
                    Text("Descripción del espacio: ").bold().padding(.leading,20)
                  }.padding()
                  HStack{
                    Text("\(space.description)").padding(.leading,90)
                  }
            
                  HStack {
                    Text("Servicios disponibles:").bold().padding(.leading,20)
                  }.padding()
            
                  HStack{
                        Image("wifi")
                        Image("grifo")
                        Image("telefono")
                        Image("bombilla")
                        Image("impresora")
                        Image("cocina")
               
                  }.padding(.leading,90)


        }.navigationBarTitle(" Detalles del Espacio", displayMode: .inline)
            
          .navigationBarItems(
                trailing:
            Button("Solicitar"){
                self.shouldShowOnboarding = true
        })
        .sheet(isPresented: self.$shouldShowOnboarding) {
            OnboardingView(space: self.space,operation: self.operation)
            
        }
        .onAppear {
            print("It'showing!")
            self.showVisit()
            if (self.$operation.status.wrappedValue == 1) {
                print("Bye")
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    func showVisit() {
        let defaults = UserDefaults.standard
        let userId = defaults.integer(forKey: "userId")
        
        self.ref.child("visits").child("\(self.space.id)").child("\(userId)").setValue(["visited": true]) {
             (error:Error?, ref:DatabaseReference) in
            if let error = error {
               print("Data could not be saved: \(error).")
            } else {
                print("Data saved successfully for spaceId: \(self.space.id)!")
            }
        }
    }
}
    


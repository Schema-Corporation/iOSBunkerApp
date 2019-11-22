//
//  BookingProcessStepOneView.swift
//  iBunker
//
//  Created by Victor on 11/11/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct BookingProcessStepOneView: View {
    var space: SpaceViewModel
     var settings = SettingsStore()
    @Environment(\.presentationMode) var presentationMode
    @State var startDate = Date()
    @State var period = 0
    
    @State var endDate = Date()
    @State var periods = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    @State var predefined = true
    @State private var showGreeting = true

     
    @State private var showDetails  = false
 
    @State var empty: String = ""
    
    @State var width: String = ""
    @State var area: String = ""
    @State var height: String = ""
    
    
    @State var wifiOn = true
    @ObservedObject var bookingIntention = BookingProcess()
    
    var body: some View {

        
        
        Form {
            Section(header: Text("Periodo de reserva").font(.title)){

                DatePicker(selection: $startDate, displayedComponents: .date){
                    Text("Fecha de inicio")
                }

                Picker(selection: $period, label: Text("Periodo (meses)")) {
                    ForEach(0 ..< periods.count) {
                        Text("\(self.periods[$0])")
                    }


                }

                DatePicker(selection: $endDate, displayedComponents: .date){
                    Text("Fecha de fin")
                }
            }

            Section(header: Text("Dimensiones").font(.title)) {

                    Toggle(isOn: $showGreeting) {
                        Text("Predeterminado")
                    }
                VStack {
                    if showGreeting {
                        TextField("Largo: " + space.height + " m", text: $empty).disabled(true)
                        TextField("Ancho: " + space.width + " m", text: $empty).disabled(true)
                        TextField("Área: " + space.area + " m²", text: $empty).disabled(true)

                    } else {
                        TextField("Largo", text: $height)
                        TextField("Ancho", text: $width)
                        TextField("Área", text: $area)
                    }
                }

//
             }

            Section(header: Text("Servicios disponibles").font(.title)) {
                VStack(spacing: 15) {
                      Button(action: {self.showDetails.toggle()}) {
                        if showDetails {
                            Image(systemName: "lightbulb.fill")
                        } else {
                            Image(systemName: "wifi") }
                      }
                }
            }

            
            
        }.navigationBarTitle("Solicitud de Reserva")
        .navigationBarItems(
            trailing: Button(action:  submit ){
                Text("Reservar")
                            })
           
        
    }

    func submit() {
      
        self.bookingIntention.bookingIntention(spaceId: self.space.id, startDate: self.startDate, endDate: self.endDate, monthlyFee: self.space.rent_price, periodicity: self.period, width: self.space.width, height: self.space.height)
        
    }
    
}




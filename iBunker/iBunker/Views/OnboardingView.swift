//
//  OnboardingView.swift
//  iBunker
//
//  Created by Victor on 11/21/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
     var space: SpaceViewModel
     var settings = SettingsStore()
       @State var startDate = Date()
       @State var period = 0
       @State var endDate = Date()
       @State var periods = [1,2,3,4,5,6,7,8,9,10,11,12]
       @State var predefined = true
       @State private var showGreeting = true
       @State private var wifi  = false
       @State private var light  = false
       @State private var water  = false
       @State private var kitchen  = false
       @State private var printer  = false
       @State private var phone  = false
       @State var empty: String = ""
       @State var width: String = ""
       @State var area: String = ""
       @State var height: String = ""
       @State var wifiOn = true
       @ObservedObject var bookingIntention = BookingProcess()
       @Environment(\.presentationMode) var presentationMode
       @ObservedObject var operation: OperationStatus
    
    var body: some View {
        NavigationView{
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


                         }

                        Section(header: Text("Servicios disponibles").font(.title)) {
                            VStack{
                                
                                  Button(action: {self.wifi.toggle()}) {
                                    if wifi {
                                        HStack{
                                            Image("wifi")
                                            Text("Servicio de Wifi Agregado")
                                        }
                                        
                                    } else {
                                        HStack{
                                            Image("wifi-off")
                                            Text("Sin Servicio de Wifi")
                                        }.foregroundColor(.black)
                                      }
                                  }
 
                            }
                            VStack{
                                                           
                                   Button(action: {self.light.toggle()}) {
                                     if light {
                                         HStack{
                                              Image("bombilla")
                                              Text("Servicio de Alumbrado Agregado")
                                         }
                                                                   
                                     } else {
                                         HStack{
                                              Image("bombilla-off")
                                              Text("Sin Servicio de Alumbrado ")
                                         }.foregroundColor(.black)
                                       }
                                    }
                            
                            }
                            VStack{
                                                           
                                   Button(action: {self.phone.toggle()}) {
                                     if phone {
                                         HStack{
                                              Image("telefono")
                                              Text("Servicio de Telefonía Agregado")
                                         }
                                                                   
                                     } else {
                                         HStack{
                                              Image("telefono-off")
                                              Text("Sin Servicio de Telefonía")
                                         }.foregroundColor(.black)
                                       }
                                    }
                            
                            }
                            VStack{
                                                           
                                   Button(action: {self.water.toggle()}) {
                                     if water {
                                         HStack{
                                              Image("grifo")
                                              Text("Servicio de Agua Agregado")
                                         }
                                                                   
                                     } else {
                                         HStack{
                                              Image("grifo-off")
                                              Text("Sin  Servicio de Agua")
                                         }.foregroundColor(.black)
                                       }
                                    }
                            
                            }
                            VStack{
                                                           
                                   Button(action: {self.printer.toggle()}) {
                                     if printer {
                                         HStack{
                                              Image("impresora")
                                              Text("Servicio de Impresión Agregado")
                                         }
                                                                   
                                     } else {
                                         HStack{
                                              Image("impresora-off")
                                              Text("Sin  Servicio de Impresión")
                                                
                                        }.foregroundColor(.black)
                                       }
                                }
                            
                            }
//                            VStack{
//
//                                   Button(action: {self.kitchen.toggle()}) {
//                                     if kitchen {
//                                         HStack{
//                                              Image( "cocina")
//                                              Text("Servicio de Cocina Agregado")
//                                         }
//
//                                     } else {
//                                         HStack{
//                                              Image( "cocina-off")
//                                              Text("Sin Servicio de Cocina")
//                                         }
//                                       }
//                                    }
//
//                            }
                            

                            
                        }

                        
                        
                }.navigationBarTitle("Solicitud de Reserva", displayMode: .inline)
                    .navigationBarItems(
                        trailing: Button(action: {self.onClose()} ){
                            Text("Reservar")
                                        })
            }
        }
  func onClose() {
    self.bookingIntention.bookingIntention(spaceId: self.space.id, startDate: self.startDate, endDate: self.endDate, monthlyFee: self.space.rent_price, periodicity: self.period, width: self.space.width, height: self.space.height)
    
  
    settings.didShowOnboarding = true
      self.operation.status = 1
     self.presentationMode.wrappedValue.dismiss()
    print("status",operation.status)
  }
}




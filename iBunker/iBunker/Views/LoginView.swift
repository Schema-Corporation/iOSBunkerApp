//
//  LoginView.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/21/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import Combine
import MapKit
import CoreLocation
import Foundation

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State var counter: Int = 0
    
    @ObservedObject var manager = HttpAuth()
    
    var body: some View {
        VStack {
            Spacer()
            VStack() {
                    VStack {
        Image("bunker-logo").resizable().aspectRatio(contentMode: ContentMode.fit)
            .frame(width: CGFloat(350.0), height: CGFloat(150.0)).padding(Edge.Set.bottom, CGFloat(20.0))
                        Text("Login").font(.title)
            TextField("Usuario", text: $username)
            .padding()
                .background(Color(.white)).autocapitalization(.none)
                        
            SecureField("Contraseña", text: $password) {
    // submit the password
        }.padding().background(Color(.white))
            .cornerRadius(CGFloat(4.0))
            .padding(.bottom, CGFloat(10.0))
        
        HStack() {
            Spacer()
            NavigationLink(destination: RegistrationView()) {
                Text("Registrarse")
            }
        }.padding(.bottom, CGFloat(40.0))
                        
        Button(action: submit) {
            HStack {
                Spacer()
                Text("Login").foregroundColor(.white)
                Spacer()
            }
            
        }.padding().background(Color.black).cornerRadius(CGFloat(4.0))
                        
                    }.padding()
            }
            Spacer()
            }.background(Image("bunker-background-image-2").resizable().scaledToFill())
        
    }
    
    func submit() {
        self.manager.login(username: self.username, password: self.password)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

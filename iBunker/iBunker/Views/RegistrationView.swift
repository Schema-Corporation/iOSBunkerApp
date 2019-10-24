//
//  RegisterView.swift
//  iBunker
//
//  Created by Victor on 10/23/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import Combine
struct RegistrationView: View {
    
    @State private var username: String=""
    @State private var password:String=""
  
    
    @ObservedObject var manager = HttpAuth()
    
    var body: some View {
        VStack {
            Spacer()
            VStack() {
                    VStack {
        Image("bunker-logo").resizable().aspectRatio(contentMode: ContentMode.fit)
            .frame(width: CGFloat(350.0), height: CGFloat(150.0)).padding(Edge.Set.bottom, CGFloat(20.0))
                        Text("Register").font(.title)
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
            NavigationLink(destination: ContentView()) {
                Text("Ya tienes cuenta ? Inicia Sesión")
            }
        }.padding(.bottom, CGFloat(40.0))
                        
        Button(action: submit) {
            HStack {
                Spacer()
                Text("SignUp").foregroundColor(.white)
                Spacer()
            }
            
        }.padding().background(Color.black).cornerRadius(CGFloat(4.0))
                        
                    }.padding()
            }
            Spacer()
        }.background(Image("bunker-background-image-3").resizable())
        
    }
    func submit() {
        self.manager.checkDetails(username: self.username, password: self.password)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

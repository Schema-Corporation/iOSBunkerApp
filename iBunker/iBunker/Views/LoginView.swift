//
//  LoginView.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/21/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State var counter: Int = 0
    
    var body: some View {
    VStack() {
                VStack {
    Image("bunker-logo").resizable().aspectRatio(contentMode: ContentMode.fit)
        .frame(width: CGFloat(74.0), height: CGFloat(74.0)).padding(Edge.Set.bottom, CGFloat(20.0))
    Text("Login")
        TextField("Usuario", text: $username)
        .padding()
        .background(Color("flash-white"))
                    
    SecureField("Contraseña", text: $password) {
// submit the password
    }.padding().background(Color("flash-white"))
        .cornerRadius(CGFloat(4.0))
        .padding(.bottom, CGFloat(10.0))
    
    HStack() {
        Spacer()
        NavigationLink(destination: ContentView()) {
            Text("Registrarse")
        }
    }.padding(.bottom, CGFloat(40.0))
                    
    Button(action: submit) {
    HStack {
        Spacer()
        Text("Login")
        Spacer()
    }
                        }.padding().background(Color.green).cornerRadius(CGFloat(4.0))
                }.padding()
                }.padding()
        }
    func submit() {
            //loginViewModel.performLogin()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  LoginView.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/21/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State var counter: Int = 0
    
    var manager = HttpAuth()
    
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
                .background(Color(.white))
                        
        SecureField("Contraseña", text: $password) {
    // submit the password
        }.padding().background(Color(.white))
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
        self.manager.checkDetails(username: self.username, password: self.password)
    }
}

class ServerMessage: Decodable {
    let status, message: String
}

class HttpAuth: ObservableObject {
    var didChange = PassthroughSubject<HttpAuth, Never>()
    var authenticated = false {
        didSet {
            didChange.send(self)
        }
    }
    
    func checkDetails(username: String, password: String) {
        guard let url = URL(string: "https://bunker-253200.appspot.com/login") else { return }
        
        let user: [String: String] = ["email": username, "password": password]
        
        let body: [String: [String: String]] = ["user": user]
        
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
    
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 401 {
                    // set alert
                    Alert(title: Text("Sorry"), message: Text("User and password are invalid"), dismissButton: .default(Text("Got it!")))
                } else {
                    if httpResponse.statusCode == 200 {
                        // send to navigation page
                    }
                }
                print(httpResponse.statusCode)
            }
        }.resume()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

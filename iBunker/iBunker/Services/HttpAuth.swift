//
//  HttpAuth.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/23/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ServerMessage: Decodable {
    let status, message: String
}

class HttpAuth: ObservableObject {
    var objectWillChange = PassthroughSubject<HttpAuth, Never>()
    @Published var authenticated = false {
        didSet {
            objectWillChange.send(self)
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
                } else {
                    if httpResponse.statusCode == 200 {
                        if let httpResponse = response as? HTTPURLResponse {
                             if let authToken = httpResponse.allHeaderFields["Authorization"] as? String {
                                //
                                DispatchQueue.main.async {
                                    let defaults = UserDefaults.standard
                                    defaults.set(authToken, forKey: "authToken")
                                    
                                    self.authenticated = true
                                }
                             }
                        }
                        
                    }
                }
                print(httpResponse.statusCode)
            }
        }.resume()
        
    }
}

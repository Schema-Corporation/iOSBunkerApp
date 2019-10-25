//
//  GetSpacesAround.swift
//  iBunker
//
//  Created by Victor on 10/23/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct SpacesInfo : Decodable {
    var id: Int
    var status: Int
    var rent_price: String
    var space_type: Int
    var description: String
    var title: String
    var address: String
    var first_photo: String
    
}

class GetSpacesAround : ObservableObject {
    var objectWillChange = PassthroughSubject<GetSpacesAround, Never>()
    @Published var spacesAroundList = [SpacesInfo]() {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://bunker-253200.appspot.com/api/v1/spaces/info_around/") else { return }
        
        let defaults = UserDefaults.standard
        let authToken = defaults.string(forKey: "authToken")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue(authToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard let data = data else { return }
            
            let spacesAroundList = try! JSONDecoder().decode([SpacesInfo].self, from: data)
            DispatchQueue.main.async {
                self.spacesAroundList = spacesAroundList
            }
            
            
        }.resume()
    }
}


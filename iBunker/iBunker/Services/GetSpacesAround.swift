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
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNTcxOTEzNjM1LCJleHAiOjE1NzE5MTU0MzUsImp0aSI6IjM4MDdkMTJhLTAwZDAtNGNmYS05N2NiLTZkODg4Mjg5NzZmZSJ9.x6CzllAL9BjRyo6Ync_APJcE28QD9RbgbdVizkkQAr8", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            guard let data = data else { return }
            
            print(data)
            
            let str = String(decoding: data, as: UTF8.self)
            print(str)
            
            let spacesAroundList = try! JSONDecoder().decode([SpacesInfo].self, from: data)
            DispatchQueue.main.async {
                self.spacesAroundList = spacesAroundList
            }
            
            
        }.resume()
    }
}


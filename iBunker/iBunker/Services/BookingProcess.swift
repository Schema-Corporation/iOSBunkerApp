//
//  BookingProcess.swift
//  iBunker
//
//  Created by Victor on 11/17/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class BookingProcess: ObservableObject {
    var objectWillChange = PassthroughSubject<BookingProcess, Never>()
    @Published var bookingIntentionFinished = false {
        willSet {
            objectWillChange.send(self)
        }
    }
    
    func bookingIntention(spaceId: Int, startDate: Date, endDate: Date, monthlyFee: String, periodicity: Int, width: String, height: String) {
        guard let url = URL(string: "https://bunker-258012.appspot.com/api/v1/booking_intention") else { return }
        
        let defaults = UserDefaults.standard
        let authToken = defaults.string(forKey: "authToken")
        let lesseeId = defaults.integer(forKey: "userId")
        
        let lessee: [String: Any] = ["id": lesseeId]
        let space: [String: Any] = ["id": spaceId]
        
        let body: [String: Any] = ["lessee": lessee, "space": space, "start_date": startDate.asString(), "end_date": endDate.asString(), "monthly_fee": monthlyFee, "periodicity": periodicity, "width": width, "height": height]
        
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue(authToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 401 {
                    // go to loginView
                } else {
                    if httpResponse.statusCode == 200 {
                        if let httpResponse = response as? HTTPURLResponse {
                            //
                            print(response)
                            DispatchQueue.main.async {
                                self.bookingIntentionFinished = true
                            }
                        }
                        
                    }
                }
                print(httpResponse.statusCode)
            }
        }.resume()
        
    }
}

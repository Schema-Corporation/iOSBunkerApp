//
//  Extensions.swift
//  iBunker
//
//  Created by Victor on 11/17/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

extension Date {
    func asString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyy HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}

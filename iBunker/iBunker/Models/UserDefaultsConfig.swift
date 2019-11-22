//
//  UserDefaultsConfig.swift
//  iBunker
//
//  Created by Victor on 11/21/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
struct UserDefaultsConfig {
    @UserDefault("didShowOnboarding", defaultValue: false)
    static var didShowOnboarding: Bool
  
}

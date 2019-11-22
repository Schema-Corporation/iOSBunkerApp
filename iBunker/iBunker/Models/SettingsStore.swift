//
//  SettingsStore.swift
//  iBunker
//
//  Created by Victor on 11/21/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation
class SettingsStore: ObservableObject {
  @Published var didShowOnboarding: Bool = UserDefaultsConfig.didShowOnboarding {
    didSet {
      UserDefaultsConfig.didShowOnboarding = self.didShowOnboarding
    }
  }
  
  @Published var shouldShowOnboarding: Bool = !UserDefaultsConfig.didShowOnboarding {
    didSet {
      self.didShowOnboarding = !self.shouldShowOnboarding
    }
  }
  
}

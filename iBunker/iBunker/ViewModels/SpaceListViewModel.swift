//
//  SpaceListViewModel.swift
//  iBunker
//
//  Created by Marcelo Ríos on 11/9/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

class SpaceListViewModel: ObservableObject {
  
  @Published var spaces = [SpaceViewModel]()
  
  init() {
    GetSpacesAround().getSpacesAround(userLatitude: -12.046374, userLongitude:  -77.042793) { spaces in
      
      if let spaces = spaces {
        self.spaces = spaces.map(SpaceViewModel.init)
      }
      
    }
  }
  
}

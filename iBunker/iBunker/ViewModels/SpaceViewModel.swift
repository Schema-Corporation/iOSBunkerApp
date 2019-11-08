//
//  SpaceViewModel.swift
//  iBunker
//
//  Created by Marcelo Ríos on 11/8/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import Foundation

struct SpaceViewModel: Identifiable {
    
    var space: SpacesInfo
    
    var id = UUID()
    
    init(space: SpacesInfo) {
        self.space = space
    }
    
    var first_photo: String {
        return self.space.first_photo
    }
    
    var title: String {
        return self.space.title
    }
    
    var address: String {
        return self.space.address
    }
    
    var rent_price: String {
        return self.space.rent_price
    }
}

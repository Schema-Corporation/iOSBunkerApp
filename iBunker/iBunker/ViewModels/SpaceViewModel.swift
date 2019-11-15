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
    
    init(space: SpacesInfo) {
        self.space = space
    }
    
    var id: Int {
        return self.space.id
    }
    
    var status: Int {
        return self.space.status
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
    var description: String {
        return self.space.description
    }
    
    var height: String {
        return self.space.height
    }
    var width: String {
           return self.space.width
    }
    var area: String {
        return self.space.area
    }
    
    
}

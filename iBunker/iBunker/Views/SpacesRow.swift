//
//  SpacesRow.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct SpacesRow: View {
    var space: SpaceViewModel
    
    init(_ space: SpaceViewModel) {
        self.space = space
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
                ImageView(withURL: space.first_photo)
                    Text(space.title).font(.title).bold()
                    Text(space.address)
                    Text("$" + space.rent_price + "0")
        }.padding(EdgeInsets(top:2, leading:0, bottom: 2, trailing: 0))
    
    }
}


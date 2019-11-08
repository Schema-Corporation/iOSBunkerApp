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
    
    var body: some View {
        VStack(alignment: .leading){
                ImageView(withURL: space.first_photo).frame(minWidth:0, maxWidth: .infinity)
                    Text(space.title).font(.title).bold()
                    Text(space.address)
                    Text("S/" + space.rent_price + "0")
        }.padding(EdgeInsets(top:4, leading:0, bottom: 4, trailing: 0))
    }
}


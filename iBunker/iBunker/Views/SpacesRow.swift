//
//  SpacesRow.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct SpacesRow: View {
       @ObservedObject var getSpacesAround = GetSpacesAround()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SpacesRow_Previews: PreviewProvider {
    static var previews: some View {
        SpacesRow()
    }
}

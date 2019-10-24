//
//  SpacesDetailsView.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct SpacesDetailsView: View {
    @ObservedObject var getSpacesAround = GetSpacesAround()
    var body: some View {
        // getSpacesAround.spacesAroundList.i
        // ImageView(withURL: )
        Text("Details")
    }
}

struct SpacesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SpacesDetailsView()
    }
}

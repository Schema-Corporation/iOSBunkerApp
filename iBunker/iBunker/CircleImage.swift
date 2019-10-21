//
//  CircleImage.swift
//  iBunker
//
//  Created by Alumnos on 10/21/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image.resizable().frame(width: 110, height:110).clipShape(Circle()).overlay(Circle().stroke(Color.black, lineWidth:1))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("user-icon"))
    }
}

//
//  ButtonView.swift
//  iBunker
//
//  Created by Victor on 11/11/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
var body: some View {
    Text("Enviar Solicitud")
        .frame(width: 200, height: 100, alignment: .center)
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(17)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}

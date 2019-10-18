//
//  ConfigurationView.swift
//  iBunker
//
//  Created by Developer on 10/18/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct ConfigurationView: View {
    
    
    
    var body: some View {
        HStack {
            Image(systemName: "power")
            Text("Cerrar Sesión")
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}

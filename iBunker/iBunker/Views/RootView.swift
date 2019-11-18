//
//  RootView.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/23/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @ObservedObject var manager = HttpAuth()
    
    var body: some View {
     
        VStack {
            if manager.authenticated {
                DashboardView()
            } else {
                LoginView(manager: manager)
                //DashboardView()
            }
        }
        
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

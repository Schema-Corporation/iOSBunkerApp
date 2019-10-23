//
//  DashboardView.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/23/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            Text("First View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                }.tag(0)
            Text("Second View")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Mis Solicitudes")
                }.tag(1)
            Text("ThirdView View")
            .tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(1)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
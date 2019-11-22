//
//  DashboardTabBarView.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/26/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct DashboardTabBarView: View {
    
    
    
    var body: some View {
        NavigationView{
            TabView {
                
                FindSpacesView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Buscar")
                        .navigationBarTitle("Busqueda de espacios")
                    }.tag(0)
                //Text("Second View")
                    .tabItem {
                        Image(systemName: "person.circle")
                        Text("Mis Solicitudes")
                        
                    }.tag(1)
                
                ConfigurationView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                   
                }.tag(2)
            }
        }
    }
}

struct DashboardTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardTabBarView()
    }
}

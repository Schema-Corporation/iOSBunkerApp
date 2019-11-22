//
//  DashboardTabBarView2.swift
//  iBunker
//
//  Created by Victor on 11/12/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import BottomBar_SwiftUI

let items: [BottomBarItem] = [
    BottomBarItem(icon: "magnifyingglass", title: "Search", color: .purple),
    BottomBarItem(icon: "house.fill", title: "Home", color:.orange),
    BottomBarItem(icon: "person.fill", title: "Profile", color:.blue)
]

struct BasicView: View {
    let item: BottomBarItem

    var detailText: String {
    "\(item.title) Detail"
}
    
var body: some View {
    VStack {
        Spacer()
        }
    }
}

struct DashboardTabBarSUIView : View {
    @State private var selectedIndex: Int = 0
    @State private var showAlert = false

    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }

    var alert: Alert {
        Alert(title: Text("iOScreator"), message: Text("Hello SwiftUI"), dismissButton: .default(Text("Dismiss")))
    }
var body: some View {
        NavigationView {
            VStack {
                BasicView(item: selectedItem)
                   // .navigationBarTitle(Text(selectedItem.title))
                
                if(selectedItem.title == "Search"){
                FindSpacesView()
                    //s.navigationBarTitle("search")
                    
                }
                if(selectedItem.title == "Home"){
                //firstView()
                    Button(action: {
                        self.showAlert.toggle()
                    }) {
                        Text("Show Alert")
                    }
                    // 4.
                    .alert(isPresented: $showAlert, content: { self.alert })
                }
                if(selectedItem.title == "Profile"){
                ConfigurationView()
                }
                
                BottomBar(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}


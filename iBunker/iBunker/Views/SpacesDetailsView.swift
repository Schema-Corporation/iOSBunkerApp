//
//  SpacesDetailsView.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct SpacesDetailsView: View {
    var space: SpaceViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
              Spacer()
              HStack(alignment: .top) {
                Text("Roman Name: ").bold()
                Text("\(space.title)")
              }
              HStack {
                Text("Powers: ").bold()
                Text("\(space.title)")
              }
              HStack {
                Text("Parents: ").bold()
                Text("\(space.title) and \(space.title)")
              }
              HStack {
                Text("Symbol: ").bold()
                Text("\(space.title)")
              }
              Spacer()
              Button(action: {}) {
                  Text("Favorite")
                }
              .scaledToFill()
                .frame(minWidth: 100, idealWidth: 200, maxWidth: 350)
              .padding()
              .background(Color.blue)
              .foregroundColor(Color.white)
              .cornerRadius(10)
            }
            .navigationBarTitle("About \(space.title)")
          }
          
          
        }
    }

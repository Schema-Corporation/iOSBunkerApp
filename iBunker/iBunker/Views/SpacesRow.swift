//
//  SpacesRow.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import Firebase

struct SpacesRow: View {
    var space: SpaceViewModel
    private var ref: DatabaseReference! = Database.database().reference()
    
    init(_ space: SpaceViewModel) {
        self.space = space
        
        let defaults = UserDefaults.standard
        let userId = defaults.integer(forKey: "userId")
        
        self.ref.child("visits").child("\(space.id)").child("\(userId)").setValue(["visited": true]) {
             (error:Error?, ref:DatabaseReference) in
            if let error = error {
               print("Data could not be saved: \(error).")
            } else {
                print("Data saved successfully for spaceId: \(space.id)!")
            }
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading){
            
                ImageView(withURL: space.first_photo).frame(minWidth:0, maxWidth: .infinity)
                    Text(space.title).font(.title).bold()
                    Text(space.address)
                    Text("$" + space.rent_price + "0")
        }.padding(EdgeInsets(top:4, leading:0, bottom: 4, trailing: 0))
    }
}


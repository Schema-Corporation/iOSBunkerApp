//
//  FindSpacesView.swift
//  iBunker
//
//  Created by Victor on 10/23/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct FindSpacesView: View {
    
    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
         return "\(locationManager.lastLocation?.coordinate.latitude ?? 0.00)"
    }

    var userLongitude: String {
         return "\(locationManager.lastLocation?.coordinate.longitude ?? 0.00)"
    }
    
    
    @ObservedObject var getSpacesAround = GetSpacesAround.init(userLatitude: -12.076460,userLongitude: -77.045110)
    
    
    var body: some View {
         NavigationView {
            List (getSpacesAround.spacesAroundList, id: \.id){ space in
                
                NavigationLink(destination: SpacesDetailsView()){
                    VStack(alignment: .leading){
                       
                        ImageView(withURL: space.first_photo).frame(minWidth:0, maxWidth: .infinity)
    
                            Text(space.title).font(.title).bold()
                            Text(space.address)
                            Text("S/" + space.rent_price + "0")
                        
                        
                    }.padding(EdgeInsets(top:4, leading:0, bottom: 4, trailing: 0))
                
                    }
                
                
            }
            .navigationBarTitle(Text("Búsqueda de Espacios"))
        }
    }
}

struct FindSpacesView_Previews: PreviewProvider {
    static var previews: some View {
        FindSpacesView()
    }
}
//
class ImageLoader: ObservableObject {
    @Published var dataIsValid = false
    var data:Data?

    init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.dataIsValid = true
                self.data = data
            }
        }
        task.resume()
    }
}

// ImageView

func imageFromData(_ data:Data) -> UIImage {
    UIImage(data: data) ?? UIImage()
}



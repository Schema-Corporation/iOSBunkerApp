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
    
    
    @ObservedObject private var spaceListViewModel = SpaceListViewModel()
    
    var body: some View {
         NavigationView {
            List (self.spaceListViewModel.spaces){ space in
                NavigationLink(destination: SpacesDetailsView(space: space)) {
                    SpacesRow(space: space)
            }
            .navigationBarTitle(Text("Búsqueda de Espacios"))
            }
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



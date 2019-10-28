//
//  DashboardView.swift
//  iBunker
//
//  Created by Marcelo Ríos on 10/23/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct DashboardView: View {
    @ObservedObject var locationManager = LocationManager()

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        
        
        DashboardTabBarView()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

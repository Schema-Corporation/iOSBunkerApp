//
//  ImageView.swift
//  iBunker
//
//  Created by Victor on 10/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()

    init(withURL url:String) {
         imageLoader = ImageLoader(urlString:url)
    }
    var body: some View {
        VStack {
            Image(uiImage: imageLoader.dataIsValid ? imageFromData(imageLoader.data!) : UIImage())
                .resizable().frame(minWidth: 375 ,minHeight: 300)
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.horizontal)
            
        }.padding(.leading,0)
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "https://www.purina.es/gato/purina-one/sites/g/files/mcldtz1856/files/2018-06/Como_saber_si_mi_gato_esta_enfermo%20%282%29.jpg")
    }
}

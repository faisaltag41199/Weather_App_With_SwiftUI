//
//  WeatherGridItem.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct WeatherGridItem: View {
    
    let title:String
    let subTitle:String
    
    var body: some View {
        VStack{
            Text("\(title)")
                .font(.system(size: 22, weight: .regular)).padding(.bottom,10)
        
            Text("\(subTitle)")
                .font(.system(size: 26, weight: .semibold))
        }
    }
}

struct HomeGridItem_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGridItem(title: "Visibility", subTitle: "10 Km")
    }
}

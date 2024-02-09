//
//  WeatherGrid.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct WeatherGrid: View {
    
    var homeViewModel : HomeViewModel?

    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    
        var body: some View {
    
                LazyVGrid(columns: adaptiveColumn, spacing: 50) {
                    
                    WeatherGridItem(title: "VISIBILITY", subTitle: homeViewModel?.getVisibility() ?? "0")      //Here is where we use the opacity

                    WeatherGridItem(title: "HUMIDITY", subTitle: homeViewModel?.getHumidity() ?? "0")
                    
                    WeatherGridItem(title: "FEELS LIKE", subTitle:homeViewModel?.getFeelsLike() ?? "0")
                    
                    WeatherGridItem(title: "PRESSURE", subTitle: homeViewModel?.getPressure() ?? "0")
                    
                }//Here is where we use the opacity

            
    }
}

struct WeatherGrid_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGrid()
    }
}

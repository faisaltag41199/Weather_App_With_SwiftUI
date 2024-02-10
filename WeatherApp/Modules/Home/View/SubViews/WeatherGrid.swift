//
//  WeatherGrid.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct WeatherGrid: View {
    
    var weatherViewModel : WeatherViewModel?

    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    
        var body: some View {
    
                LazyVGrid(columns: adaptiveColumn, spacing: 50) {
                    
                    WeatherGridItem(title: "VISIBILITY", subTitle: (weatherViewModel?.getVisibility() ?? "0 KM") + " KM")      //Here is where we use the opacity

                    WeatherGridItem(title: "HUMIDITY", subTitle: (weatherViewModel?.getHumidity() ?? "0")+" %")
                    
                    WeatherGridItem(title: "FEELS LIKE", subTitle:weatherViewModel?.getFeelsLike() ?? "0")
                    
                    WeatherGridItem(title: "PRESSURE", subTitle: weatherViewModel?.getPressure() ?? "0")
                    
                }//Here is where we use the opacity

            
    }
}

struct WeatherGrid_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGrid()
    }
}

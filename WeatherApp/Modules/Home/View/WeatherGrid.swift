//
//  WeatherGrid.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct WeatherGrid: View {
    
    private let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    
        var body: some View {
    
                LazyVGrid(columns: adaptiveColumn, spacing: 50) {
                    
                    WeatherGridItem(title: "VISIBILITY", subTitle: "String")      //Here is where we use the opacity

                    WeatherGridItem(title: "HUMIDITY", subTitle: "String")
                    WeatherGridItem(title: "FEELS LIKE", subTitle: "String")
                    WeatherGridItem(title: "PRESSURE", subTitle: "String")
                    
                }//Here is where we use the opacity

            
    }
}

struct WeatherGrid_Previews: PreviewProvider {
    static var previews: some View {
        WeatherGrid()
    }
}

//
//  ForecastRow.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct ForecastRow: View {
    
    let day:String
    let imageName:String
    let lowestTempreture:String
    let highestTempreture:String

    var body: some View {
        VStack{
            
             Divider()
                .frame(minHeight: 1.5)
                   .overlay(Color.black)
        
            HStack{
                
                Text("\(day)")
                    .font(.system(size: 25, weight: .semibold))
                Text("  ")

                Image("\(imageName)").resizable().frame(width: 30,height: 40)
                Text("  ")
                
                Text("\(lowestTempreture)")
                    .font(.system(size: 25, weight: .semibold))
                Text("-")
                    .font(.system(size: 25, weight: .semibold))
                Text("\(highestTempreture)")
                    .font(.system(size: 25, weight: .semibold))


            }

        }
    }
}

struct ForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastRow(day: "today", imageName: "cloudy", lowestTempreture: "7.5", highestTempreture: "18.5")
    }
}

//
//  ForecastRow.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct ForecastRow: View{
    
    let day:String
    let imageURL:String
    let lowestTempreture:String
    let highestTempreture:String

    var body: some View {
        VStack{
            
             Divider()
                .frame(minHeight: 1.5)
                   .overlay(ColorHelper.getAppColor())
        
            HStack{
                
                Text("\(day)")
                    .font(.system(size: 20, weight: .semibold)).frame(width: 60)
                    .foregroundColor(ColorHelper.getAppColor())


                AsyncImage(url: URL(string:imageURL)) { item in
                    
                    item.image?.resizable().frame(width: 30,height: 40)
                
                }
                Text("  ")
                
                Text(lowestTempreture)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(ColorHelper.getAppColor())

                Text("-")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(ColorHelper.getAppColor())

                Text(highestTempreture)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(ColorHelper.getAppColor())



            }

        }
    }
}

struct ForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastRow(day: "today", imageURL: "cloudy", lowestTempreture: "7.5", highestTempreture: "18.5")
    }
}

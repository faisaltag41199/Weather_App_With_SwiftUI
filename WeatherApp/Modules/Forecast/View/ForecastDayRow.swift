//
//  ForecastDayRow.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 07/02/2024.
//

import SwiftUI

struct ForecastDayRow: View {
    
    let hour:String
    let imageURL:String
    let tempreture:String
    
    var body: some View {
        
        HStack{
            
            Text(hour)
                .font(.system(size: 35, weight: .regular))
            Text("  ")

            AsyncImage(url: URL(string:imageURL)) { item in
                
                item.image?.resizable().frame(width: 50,height: 65)
            
            }
            Text("  ")
            
            Text(tempreture)
                .font(.system(size: 35, weight: .regular))

        }

    }
}

struct ForecastDayRow_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayRow(hour: "today", imageURL: "cloudy", tempreture:"18.5")
    }
}

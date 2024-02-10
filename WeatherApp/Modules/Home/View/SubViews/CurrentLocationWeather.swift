//
//  CurrentLocationWeather.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct CurrentLocationWeather: View {
    
    var weatherViewModel : WeatherViewModel?
    
    var body: some View {
        
        VStack{
            
            Text(weatherViewModel?.getLocationName() ?? "0")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(ColorHelper.getAppColor())
            
            Text(weatherViewModel?.getTempreture() ?? "0")
                .font(.system(size: 50, weight: .regular))
                .foregroundColor(ColorHelper.getAppColor())
            
            Text(weatherViewModel?.getCondition() ?? "no data")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(ColorHelper.getAppColor())
            
            HStack{
                
                Text("H :" + (weatherViewModel?.getCurrentHighTempreture() ?? "0"))
                     .foregroundColor(ColorHelper.getAppColor())
                
                Text("L : " + (weatherViewModel?.getCurrentLowTempreture() ?? "0"))
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(ColorHelper.getAppColor())
            }
            
            AsyncImage(url: URL(string:weatherViewModel?.getCurrendConditionImageURL() ?? "/")) { item in
                
                item.image?.resizable().frame(width: 70,height: 70).scaleEffect(2)
            
            }


        }
       
        

    }
}

struct CurrentLocationWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationWeather()
    }
}

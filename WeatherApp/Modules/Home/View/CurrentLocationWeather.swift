//
//  CurrentLocationWeather.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct CurrentLocationWeather: View {
    var body: some View {
        
        VStack{
            
            Text("Cairo")
                .font(.system(size: 20, weight: .bold))
            Text("21")
                .font(.system(size: 50, weight: .regular))
            Text("PartlyCloudy")
                .font(.system(size: 20, weight: .regular))
            HStack{
                Text("H : 30")
                    .font(.system(size: 20, weight: .regular))
                Text("L : 20")
                    .font(.system(size: 20, weight: .regular))
            }
            
            Image("cloudy").resizable().frame(width: 80,height: 80)


        }
       
        

    }
}

struct CurrentLocationWeather_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationWeather()
    }
}

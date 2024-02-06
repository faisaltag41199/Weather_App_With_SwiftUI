//
//  Weather.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct WeatherHomeView: View {
    var body: some View {
        ZStack{
            Image("dayLight")
                .resizable()
                .frame(
                    width:UIScreen.screenWidth
                    ,height:UIScreen.screenHeight)
                .ignoresSafeArea()
            
        VStack{
            
            CurrentLocationWeather()
            ForecastList()
                .frame(width: 330, height:240)
            WeatherGrid()
        }
            
        }
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeView()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

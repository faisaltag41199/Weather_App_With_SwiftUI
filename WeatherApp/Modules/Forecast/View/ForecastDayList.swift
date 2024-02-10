//
//  ForecastDayList.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 07/02/2024.
//

import SwiftUI

struct ForecastDayList: View {
    
    var weatherViewModel : WeatherViewModel?
    
    var body: some View {

        ZStack{
            
            ImageHelper.getAppImage()
                .resizable()
                .frame(
                    width:UIScreen.screenWidth
                    ,height:UIScreen.screenHeight)
                .ignoresSafeArea()
          
            List(weatherViewModel?.getForecastDayHours() ?? [] ){ item in
                
                ForecastDayRow(hour: weatherViewModel?.getForecastDayHour(hour:item) ?? "00:00", imageURL: weatherViewModel?.getForecastDayHourConditionImageURL(hour: item) ?? "/" , tempreture: weatherViewModel?.getForecastDayHourTempreture(hour: item) ?? "0" )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color
                    .white
                    .opacity(0))
                
            }.scrollContentBackground(.hidden).padding(.all,10)
           
        }
    }
}

struct ForecastDayList_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayList()
    }
}



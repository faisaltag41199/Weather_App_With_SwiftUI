//
//  ForecastList.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct ForecastList: View {
    
    var weatherViewModel : WeatherViewModel?
    @State private var isActive = false

     var body: some View {
      
         VStack(alignment: .leading, spacing: 0){
             
             Text("3-DAY FORECAST")  .foregroundColor(ColorHelper.getAppColor()).offset(x:32,y:20)
                 .frame(height:5)                .font(.system(size: 15, weight: .regular))

             
             List(weatherViewModel?.getForecastDays() ?? []){ item in
                 
                  NavigationLink(destination:ForecastDayList(weatherViewModel: weatherViewModel),
                       isActive:$isActive
                  )  {
                     
                     ForecastRow(day: weatherViewModel?.getForecastDayName(forecastDayModel: item) ?? "nodata"
                                 , imageURL: weatherViewModel?.getForecastImageURL(forecastDayModel: item) ?? "nodata"
                                 ,lowestTempreture: weatherViewModel?.getForecastDayLowTempreture(forecastDayModel: item) ?? "no data"
                                 ,highestTempreture: weatherViewModel?.getForecastDayHighTempreture(forecastDayModel: item) ?? "no data")
                      
                 }.listRowSeparator(.hidden)
                     .frame(height:40)
                     .listRowBackground(Color
                         .white
                        .opacity(0)).onTapGesture {
                            
                            weatherViewModel?.setSelectedForecastDay(forecastDayModel: item)
                            
                            isActive.toggle()
                        }
                 
             }.scrollContentBackground(.hidden)
                 .scrollDisabled(true)
         }

    }
}

struct ForecastList_Previews: PreviewProvider {
    static var previews: some View {
        ForecastList()
    }
}

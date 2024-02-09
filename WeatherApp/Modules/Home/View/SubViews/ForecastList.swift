//
//  ForecastList.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct ForecastList: View {
    
    var homeViewModel : HomeViewModel?

    var body: some View {
        NavigationView{
        List(homeViewModel?.getForecastDays() ?? []){ item in
            
            NavigationLink(destination:ForecastDayList(homeViewModel: homeViewModel))  {
                
                ForecastRow(day: homeViewModel?.getForecastDayName(forecastDayModel: item) ?? "nodata"
                            , imageURL: homeViewModel?.getForecastImageURL(forecastDayModel: item) ?? "nodata"
                            ,lowestTempreture: homeViewModel?.getForecastDayLowTempreture(forecastDayModel: item) ?? "no data"
                            ,highestTempreture: homeViewModel?.getForecastDayHighTempreture(forecastDayModel: item) ?? "no data")
                .listRowSeparator(.hidden)
                .frame(height:40)
                .listRowBackground(Color
                    .white
                    .opacity(0))
                .onAppear{
                    
                    homeViewModel?.setSelectedForecastDay(forecastDayModel: item)
                }
            }
            
        }.scrollContentBackground(.hidden)
            .scrollDisabled(true).navigationTitle("3-Days Forecast")
    }
        
    }
}

struct ForecastList_Previews: PreviewProvider {
    static var previews: some View {
        ForecastList()
    }
}

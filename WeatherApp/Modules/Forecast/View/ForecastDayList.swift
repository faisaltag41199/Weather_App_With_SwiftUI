//
//  ForecastDayList.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 07/02/2024.
//

import SwiftUI

struct ForecastDayList: View {
    
    var homeViewModel : HomeViewModel?
    
    var body: some View {

        ZStack{
            
            ImageHelper.getAppImage()
                .resizable()
                .frame(
                    width:UIScreen.screenWidth
                    ,height:UIScreen.screenHeight)
                .ignoresSafeArea()

            List(homeViewModel?.getForecastDayHours() ?? [] ){ item in
                
                ForecastDayRow(hour: homeViewModel?.getForecastDayHour(hour:item) ?? "00:00", imageURL: homeViewModel?.getForecastDayHourConditionImageURL(hour: item) ?? "/" , tempreture: homeViewModel?.getForecastDayHourTempreture(hour: item) ?? "0" )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color
                    .white
                    .opacity(0))
                
            }.scrollContentBackground(.hidden)
        
        }
    }
}

struct ForecastDayList_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayList()
    }
}



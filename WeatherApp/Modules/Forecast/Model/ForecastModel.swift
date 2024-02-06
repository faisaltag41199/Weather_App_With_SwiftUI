//
//  Forecast.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import Foundation

class ForecastModel : Codable{
    
    let forecastDays : [ForecastDayModel]?
    
    enum CodingKeys : String ,CodingKey {
        case forecastDays = "forecastday"
    }
    
}

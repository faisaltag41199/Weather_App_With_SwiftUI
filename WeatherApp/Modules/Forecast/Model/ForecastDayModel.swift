//
//  ForecastDayModel.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import Foundation

class ForecastDayModel : Codable{
    
    let date:String?
    let day:DayModel?
    let hours:[HourModel]?
    
    enum CodingKeys : String ,CodingKey {
        
        case date = "date"
        case day = "day"
        case hours = "hour"
    }
    
}

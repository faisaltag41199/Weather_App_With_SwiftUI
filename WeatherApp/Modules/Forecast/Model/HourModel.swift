//
//  HourModel.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import Foundation

class HourModel : Codable{
    
      let time: String
      let tempC: Double
      let isDay: Int
      let condition: ConditionModel

      enum CodingKeys: String, CodingKey{
          case time = "time"
          case tempC = "temp_c"
          case isDay = "is_day"
          case condition = "condition"
      }
    
}



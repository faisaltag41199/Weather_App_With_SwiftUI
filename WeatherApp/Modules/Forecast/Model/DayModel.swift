//
//  DayModel.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import Foundation

class DayModel : Codable{
    
    let maxtempC,mintempC : Double
    let condition: ConditionModel

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition = "condition"
       }
}

//
//  ConditionModel.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import Foundation

class ConditionModel : Codable{

    let name : String?
    let iconURL : String?
    
    enum CodingKeys : String , CodingKey {
        case name = "text"
        case iconURL = "icon"
    }
    
}

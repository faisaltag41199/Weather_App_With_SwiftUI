//
//  Location.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import Foundation

class LocationModel : Codable{
    
    let name:String?
    let dateTime:String?
    
    enum CodingKeys : String , CodingKey {
        
        case name = "name"
        case dateTime = "localtime"
    }
    
}

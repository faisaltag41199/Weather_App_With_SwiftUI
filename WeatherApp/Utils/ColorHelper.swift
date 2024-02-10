//
//  ColorHelper.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 08/02/2024.
//

import Foundation
import SwiftUI

class ColorHelper{
    
    static func getAppColor()-> Color{
        
        if DateHelper.isNight() {
            return Color.white
        }else{
           return Color.black
        }
    }
}

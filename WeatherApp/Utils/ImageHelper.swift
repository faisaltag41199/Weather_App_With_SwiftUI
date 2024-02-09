//
//  ImageHelper.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 08/02/2024.
//

import Foundation
import SwiftUI

class ImageHelper{
    
    static let imageNight = "dayNight"
    static let imageDay = "dayLight"
    
    static func getAppImage()-> Image{

        if DateHelper.isNight(){
            return Image(ImageHelper.imageNight)
        }else{
            return Image(ImageHelper.imageDay)
        }
        
    }
}

//
//  URLHandler.swift
//  WeatherApp
//
//  Created by Menna Setait on 07/02/2024.
//

import Foundation
import CoreLocation
protocol URLHandlerProtocol{
    
    func getUrl() -> String
    
}

class URLHandler : URLHandlerProtocol{
    
    var latitude = 0.0
    var longitude = 0.0
    var separator = ","
    var condition = "&days=3&alerts=no"
    
    var locManager:CLLocationManager?
    
    var coordinates : String {
        get{
            print("&q=\(longitude)\(separator)\(latitude)\(condition)")
            return "&q=\(longitude)\(separator)\(latitude)\(condition)"
        }
    }
    let ApiKey = "5cd665552cd24779a56194619240502"
    let mainURl = "https://api.weatherapi.com/v1/forecast.json?key="

    var URlApi : String {
        get{
            print("\(mainURl)\(ApiKey)\(coordinates)")
            return "\(mainURl)\(ApiKey)\(coordinates)"
        }
    }
    
     init(){
    
        locManager = CLLocationManager()
        self.getLocation()
    }
    
    func getLocation(){
        
        locManager?.requestWhenInUseAuthorization()
        var currentLocation: CLLocation!
        if locManager?.authorizationStatus == .authorizedWhenInUse || locManager?.authorizationStatus == .authorizedAlways {
            currentLocation = locManager?.location
        }
        
        self.latitude = currentLocation?.coordinate.latitude ?? 0.0
        self.longitude = currentLocation?.coordinate.longitude ?? 0.0
        
    }
    
    func getUrl() -> String{
        return URlApi
    }
}

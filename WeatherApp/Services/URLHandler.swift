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
    
    func getLocation(){
        
        var locManager = CLLocationManager()
        
        locManager.requestWhenInUseAuthorization()
        var currentLocation: CLLocation!
        if locManager.authorizationStatus == .authorizedWhenInUse || locManager.authorizationStatus == .authorizedAlways {
            currentLocation = locManager.location
        }
        self.latitude = currentLocation.coordinate.latitude
        self.longitude = currentLocation.coordinate.longitude
    }
    
    func getUrl() -> String{
        return URlApi
    }
}

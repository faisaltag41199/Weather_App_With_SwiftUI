//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Menna Setait on 07/02/2024.
//

import Foundation
class HomeViewModel{
    
    var bindResultToViewController : (()->(Void))?
    
    var networkHandler : NetworkServiceDelegate
    
    init(networkHandler: NetworkServiceDelegate) {
        self.networkHandler = networkHandler
    }
    

    //MARK: - Loading Weather Model
    func getWeatherData()-> WeatherModel?{
        return weatherData
    }
    
    var weatherData: WeatherModel?  {
        didSet{
            print("did set")
            if let validHander =  bindResultToViewController {
                validHander()
            }
        }
    }
    
    func loadWeatherData()   {
        networkHandler.fetchDataFromAPI ( complitionHandler: { (data:WeatherModel?, error: Error?) in
            if let loadedData = data {
                self.weatherData = loadedData
            }else {
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    
}

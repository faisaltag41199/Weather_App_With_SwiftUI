//
//  Weather.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 06/02/2024.
//

import SwiftUI

struct WeatherHomeView: View {
    
    var weatherViewModel : WeatherViewModel?
    @State var weatherModel:WeatherModel?
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                if weatherModel != nil{
                    
                    ImageHelper.getAppImage()
                        .resizable()
                        .frame(
                            width:UIScreen.screenWidth
                            ,height:UIScreen.screenHeight)
                        .ignoresSafeArea()
                    
                    VStack{
                        
                        CurrentLocationWeather(weatherViewModel: self.weatherViewModel)
                        
                        ForecastList(weatherViewModel: self.weatherViewModel)
                            .frame(width: 330, height:240)
                        
                        WeatherGrid(weatherViewModel: self.weatherViewModel)
                    }
                    
                }else{
                    
                    VStack{
                        ProgressView().tint(.blue).scaleEffect(3)
                        Text(" ").frame(height:50)
                        Text("loading data please wait....")
                    }
                }
                
                
            }.onAppear{
                
                prepareViewModel()
            }
            
            
            
        }        
    }
    
    func prepareViewModel(){
        
        self.weatherViewModel?.bindResultToViewController =
        {
            
            self.weatherModel = weatherViewModel?.getWeatherData()
            print("///////////////////////////////")
            print(self.weatherModel?.location?.name ?? "no name")
        }
        
        weatherViewModel?.loadWeatherData()
    }

}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHomeView()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

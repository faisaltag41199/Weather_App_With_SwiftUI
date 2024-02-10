//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Menna Setait on 07/02/2024.
//

import Foundation
class WeatherViewModel{
    
    var bindResultToViewController : (()->(Void))?
    var networkHandler : NetworkServiceDelegate
    var selectedForecastDay:ForecastDayModel?
    
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
    
    func loadWeatherData(){
        
        networkHandler.fetchDataFromAPI( complitionHandler: { (data:WeatherModel?, error: Error?) in
            if let loadedData = data {
                self.weatherData = loadedData
            }else {
                if let error = error{
                    print(error.localizedDescription)
                }
            }
        })
    }
    
    func getLocationName() -> String{
        return self.weatherData?.location?.name ?? "no data"
    }
    
    func getTempreture()-> String {
        return String(self.weatherData?.current?.tempC ?? 0)
    }
    
    func getCondition()->String{
        return self.weatherData?.current?.condition?.name ?? "no data"
    }
    
    func getCurrendConditionImageURL()-> String{
        return "https:" + (self.weatherData?.current?.condition?.iconURL ?? "no data")
    }
    
    func getCurrentHighTempreture()-> String{
        return String(self.weatherData?.forecast?.forecastDays?[0].day?.maxtempC ?? 0)
    }
    
    
    func getCurrentLowTempreture()-> String{
        return String(self.weatherData?.forecast?.forecastDays?[0].day?.mintempC ?? 0)
    }
    
    func getVisibility()-> String{
        return String(self.weatherData?.current?.visibilityKM ?? 0)
    }
    
    func getHumidity()->String {
        return String(self.weatherData?.current?.humidity ?? 0)
    }
    
    func getFeelsLike()->String {
        return String(self.weatherData?.current?.feelslikeC ?? 0)
    }
    
    func getPressure()->String {
        return String(self.weatherData?.current?.pressureMB ?? 0)
    }
    
    func getForecastDays()->[ForecastDayModel]{
        return self.weatherData?.forecast?.forecastDays ?? []
    }
    
    func getForecastDayName(forecastDayModel:ForecastDayModel)->String{
        return DateHelper.getDateDayName(stringDate: forecastDayModel.date ?? "0-0-0 0:0:0")
    }
    
    func getForecastDayHighTempreture(forecastDayModel:ForecastDayModel)-> String{
        return String(forecastDayModel.day?.maxtempC ?? 0)
    }
    
    func getForecastDayLowTempreture(forecastDayModel:ForecastDayModel)-> String{
        return String(forecastDayModel.day?.mintempC ?? 0)
    }
    
    func getForecastImageURL(forecastDayModel:ForecastDayModel)-> String{
        return "https:" + (forecastDayModel.day?.condition.iconURL ?? "/")
    }
    
    func setSelectedForecastDay(forecastDayModel:ForecastDayModel){
        selectedForecastDay = forecastDayModel
    }
    
    func getForecastDayHours()->[HourModel]{
    
        if self.getForecastDayName(forecastDayModel: selectedForecastDay!) == "Today"{
            
            let hoursAfterNow = selectedForecastDay?.hours?.filter({
                
                DateHelper.isHourInStringDateAfterNow(stringDate: $0.time ?? "0-0-0 0:0" )
            
            }) ?? []

            return hoursAfterNow

        }
        
        return selectedForecastDay?.hours ?? []
        
    }
    
    func getForecastDayHour(hour:HourModel) -> String {
        
        return DateHelper.getHourFromDate(stringDate:hour.time ?? "0-0-0 0:0")
    }
    
    func getForecastDayHourConditionImageURL(hour:HourModel)->String{
        
        return "https:" + (hour.condition?.iconURL ?? "/")

    }
    
    func getForecastDayHourTempreture(hour:HourModel) -> String{
        
        return String(hour.tempC ?? 0)

    }
    
}

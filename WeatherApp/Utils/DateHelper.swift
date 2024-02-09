//
//  DateHelper.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 08/02/2024.
//

import Foundation

class DateHelper{
    
    static func isNight()-> Bool{
        
        let hour:Int = DateHelper().getCurrentHour()
        
        if hour >= 5 && hour < 18
        {
            return false
        }else{
            return true
        }
    }
    
    private func getCurrentHour()->Int {
        
       let hour = Calendar.current.component(.hour, from: Date())
        return hour
    }
    
    static func getHourFromDate(stringDate:String)->String {
        
        let date =  DateHelper()
            .convertDateInStringToDate(
                stringDate: stringDate,
                strDateFormat:"yyyy-MM-dd HH:mm")

        var hour = Calendar.current.component(.hour, from:date)
        var hourInString = String(hour)
        
        if hour == 12{
            hourInString = hourInString + " " + "PM"
        }else if hour == 0{
            hourInString = "12 " + "AM"
        }
        else if hour > 12 {
            hourInString = String(hour - 12 ) + " " + "PM"
        }else{
            hourInString = hourInString + " " + "AM"
        }
        
        return hourInString
    }
    
    static func getDateDayName(stringDate:String)-> String{
        
        
        let date = DateHelper()
            .convertDateInStringToDate(
                stringDate: stringDate,
                strDateFormat:"yyyy'-'MM'-'dd")

        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "EEEE"
        var dayInWeek = newDateFormatter.string(from: date )
        let todayName = newDateFormatter.string(from: Date())


        if todayName == dayInWeek{
            dayInWeek = "Today"
        }else{
            dayInWeek = String(dayInWeek.prefix(3))
        }

        return dayInWeek

    }
    
    func convertDateInStringToDate(stringDate:String,strDateFormat:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strDateFormat
        return dateFormatter.date(from:stringDate) ?? Date()
    }
    
}

enum DayPhase{
    case day
    case night
}

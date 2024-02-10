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
    
    static func isHourInStringDateAfterNow(stringDate:String)->Bool
    {
        
        let date =  DateHelper()
            .convertDateInStringToDate(
                stringDate: stringDate,
                strDateFormat:"yyyy-MM-dd HH:mm")
        
        let hour = Calendar.current.component(.hour, from:date)
        let nowHour = Calendar.current.component(.hour, from:Date())
        
        if(hour >= nowHour){
            return true
        }else{
            return false
        }
    }
    
    static func getHourFromDate(stringDate:String)->String {
        
        var nowHour = Calendar.current.component(.hour, from:Date())
        
        let date =  DateHelper()
            .convertDateInStringToDate(
                stringDate: stringDate,
                strDateFormat:"yyyy-MM-dd HH:mm")
        
        var hour = Calendar.current.component(.hour, from:date) // hour from theStringDate
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
        
        if nowHour == hour {
            
            let dayName = DateHelper().getDateDayNameWithFormat(stringDate: stringDate, format: "yyyy-MM-dd HH:mm")
            
            print(dayName)
            
            if dayName == "Today"{
                hourInString = "Now "
            }
        }
        
        return hourInString
    }
    
    private func getDateDayNameWithFormat(stringDate:String,format:String)-> String{
        
        let date = DateHelper()
            .convertDateInStringToDate(
                stringDate: stringDate,
                strDateFormat:format)

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
    
    
    
    private func convertDateInStringToDate(stringDate:String,strDateFormat:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = strDateFormat
        return dateFormatter.date(from:stringDate) ?? Date()
    }
    
}

enum DayPhase{
    case day
    case night
}

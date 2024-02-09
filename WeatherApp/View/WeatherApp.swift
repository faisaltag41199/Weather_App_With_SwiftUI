//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 05/02/2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    
    var homeViewModel:HomeViewModel?
    @StateObject var monitor = Monitor()

    init() {
        self.prepareHomeViewModel()
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            if monitor.isConnected(){
                
                WeatherHomeView(homeViewModel: self.homeViewModel)
                
            }else{
                ConnectionCheckerView()
            }
        }
    }
    
    mutating func prepareHomeViewModel(){
        
        let networkManager = NetworkServices(delegate: URLHandler())
        let homeViewModel = HomeViewModel(networkHandler: networkManager)
        self.homeViewModel = homeViewModel
    }
    
}


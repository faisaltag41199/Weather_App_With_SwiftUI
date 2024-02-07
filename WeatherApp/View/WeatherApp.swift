//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 05/02/2024.
//

import SwiftUI

@main
struct WeatherApp: App {
    var urlHandler = URLHandler()
    //var networkManager = NetworkServices(delegate: URLHandler)
    //var homeViewModel = HomeViewModel(networkHandler: networkManager)
    var body: some Scene {
        WindowGroup {
            WeatherHomeView()
            
        }
    }
}

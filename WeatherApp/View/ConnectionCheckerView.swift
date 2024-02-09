//
//  ConnectionCheckerView.swift
//  WeatherApp
//
//  Created by Faisal TagEldeen on 08/02/2024.
//

import SwiftUI

struct ConnectionCheckerView: View {
    var body: some View {
        
        VStack{
            Text("No Internet Connection ").font(.system(size: 40, weight: .bold))
            
            Text(" ").frame()
            Text("please chech your connection").foregroundColor(Color.gray)
        }
 
    }
}

struct ConnectionCheckerView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionCheckerView()
    }
}

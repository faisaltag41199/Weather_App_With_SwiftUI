//
//  NetworkServices.swift
//  WeatherApp
//
//  Created by Menna Setait on 07/02/2024.
//

import Foundation
import Alamofire

protocol NetworkServiceDelegate{
    var delegate : URLHandlerProtocol { get set }
    func fetchDataFromAPI<T:Codable>(complitionHandler:@escaping(T? , Error?)->Void)
}

class NetworkServices: NetworkServiceDelegate {
    
    var delegate : URLHandlerProtocol
    
    init(delegate : URLHandlerProtocol){
        self.delegate = delegate
    }
  
    
    //MARK: - Fetching Data From Api
    
    func fetchDataFromAPI<T:Codable>(complitionHandler: @escaping (T?,Error?) -> Void) {
        AF.request(delegate.getUrl()).response { data in
            if let myData = data.data {
                do{
                    print("fetching")
                    print(myData.count)
                    let retreivedData = try JSONDecoder().decode(T.self, from: myData)
                    complitionHandler(retreivedData,nil)
                }catch let error{
                    complitionHandler(nil,error)
                    print("error in casting data")
                }
            }
            else{
                print("error gdan")
            }
        }
    }
}

//
//  APIManager.swift
//  upsquare_Demo
//
//  Created by ravi lakhtariya on 06/08/21.
//

import Foundation

class APIManager {
    
    class func callGetAPI<T:Decodable>(url:URL,resultType:T.Type,completionHandler:@escaping(_ result:T?)->Void){
        var requestUrl = URLRequest.init(url: url)
        requestUrl.httpMethod = "GET"
        URLSession.shared.dataTask(with: requestUrl) { (responseData, HTTPURLResponse, error) in
            if error == nil && responseData != nil{
                do{
                    let decoder = JSONDecoder()
                    let result = try? decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                }catch let error{
                    print("error occured while decoding")
                }
            }
        }.resume()
    }
}

//
//  DetailsAPI.swift
//  IosExercise_TableView
//
//  Created by Swati Chandran on 09/01/20.
//  Copyright © 2020 SwatiChandran. All rights reserved.
//

import Foundation

class DetailsAPI {
    
    func getRequestWith(_ url:String, completion:@escaping (_ error:NSError?,_ response:Details?)->()) {
        
        
        guard let serviceUrl = URL(string: url) else { return }
        
        var request = URLRequest(url: serviceUrl)
        
        request.httpMethod = "GET"
        
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let response = response as? HTTPURLResponse{
                switch response.statusCode {
                case 200...299:
                    guard
                        let content = data else {
                            completion(nil,nil)
                            return
                    }
                    guard let decoded = String(decoding: content, as: UTF8.self).data(using: .utf8) else {
                        completion(nil,nil)
                        return
                    }
                    let datas = try! JSONDecoder().decode(Details.self, from: decoded)
                    completion(nil,datas)
                    break
                default:
                    completion(nil,nil)
                    break
                }
                print(response)
                
            }
            else {
                completion(error! as NSError,nil)
            }

            }.resume()
        
    }
}

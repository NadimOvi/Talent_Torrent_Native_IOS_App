//
//  APIRequest.swift
//  Talent Torrent
//
//  Created by Md Ashfaqur Rahman on 30/6/21.
//  Copyright © 2021 TELEAUS. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol APIRequestDataSource {
    func containDataFromAPI(json: JSON)
    func containErrorFromAPI(errorMessage: String)
}

struct APIRequest {
    var delegate: APIRequestDataSource?
    
    func getPostToAPIRequest(trailingURL: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?) {
        let hit_url = APIURL + trailingURL
        guard let urlString = hit_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        print(urlString)
        AF.request(urlString,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers).validate().responseJSON { response in
                switch response.result {
                
                case .success(let value):
                    let json = JSON(value)
                    delegate?.containDataFromAPI(json: json)

                case .failure(let error):
                    print(error)
                    delegate?.containErrorFromAPI(errorMessage: error.localizedDescription)
            }
        }
    }
    
    func sendAPIRequestBackData(trailingURL: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, completion: ((JSON?, String?) -> Void)?) {
        let hit_url = APIURL + trailingURL
        guard let urlString = hit_url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        print(urlString)
        AF.request(urlString,
                   method: method,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: headers).validate().responseJSON { response in
                    
                switch response.result {
                
                case .success(let value):
                    let json = JSON(value)
                    completion?(json, nil)
                   
                    delegate?.containDataFromAPI(json: json)
                    

                case .failure(let error):
                    print(error)
                    completion?(nil, error.localizedDescription)
                    delegate?.containErrorFromAPI(errorMessage: error.localizedDescription)
            }
        }
    }
}

